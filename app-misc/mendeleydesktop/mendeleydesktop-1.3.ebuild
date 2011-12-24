# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils multilib

MY_P_AMD64="${P}-linux-x86_64"
MY_P_X86="${P}-linux-i486"

if use amd64 || use amd64-linux ; then
	MY_P="${MY_P_AMD64}"
elif use x86 || use x86-linux ; then
	MY_P="${MY_P_X86}"
fi

DESCRIPTION="A free research management tool for desktop and web"
HOMEPAGE="http://www.mendeley.com/"
SRC_URI="amd64? ( http://download.mendeley.com/linux/${MY_P_AMD64}.tar.bz2 -> ${MY_P_AMD64}.tar.bz2 )
	x86? ( http://download.mendeley.com/linux/${MY_P_X86}.tar.bz2 -> ${MY_P_X86}.tar.bz2 )
	amd64-linux? ( http://download.mendeley.com/linux/${MY_P_AMD64}.tar.bz2 -> ${MY_P_AMD64}.tar.bz2 )
	x86-linux? ( http://download.mendeley.com/linux/${MY_P_X86}.tar.bz2 -> ${MY_P_X86}.tar.bz2 )"

LICENSE="Mendeley-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="gnome"

RESTRICT="mirror"

DEPEND=""
RDEPEND="gnome? ( dev-util/desktop-file-utils
	gnome-base/gconf:2 )
	>=x11-libs/qt-core-4.6
	>=x11-libs/qt-gui-4.6
	>=x11-libs/qt-svg-4.6
	>=x11-libs/qt-webkit-4.6
	>=x11-libs/qt-xmlpatterns-4.6"

S="${WORKDIR}/${MY_P}"

QA_PRESTRIPPED="
	/opt/mendeleydesktop/$(get_libdir)/mendeleydesktop/libexec/.*
	/opt/mendeleydesktop/$(get_libdir)/lib.*so.*"

src_prepare() {
	# remove bundled Qt libraries
	rm -rf lib/mendeleydesktop/plugins \
		|| die "failed to remove plugin directory"
	rm lib/mendeleydesktop/libexec/qt.conf \
		|| die "failed to remove qt configuration file"
	rm -rf lib/qt || die "failed to remove qt libraries"

	# force use of system Qt libraries
	sed -i "s:sys\.argv\.count(\"--force-system-qt\") > 0:True:" \
		bin/mendeleydesktop || die "failed to patch startup script"

	# fix library paths
	sed -i \
		-e "s:lib/mendeleydesktop:$(get_libdir)/mendeleydesktop:g" \
		-e "s:MENDELEY_BASE_PATH + \"/lib/\":MENDELEY_BASE_PATH + \"/$(get_libdir)/\":g" \
		bin/mendeleydesktop || die "failed to patch library path"
}

src_install() {
	# install menu
	domenu share/applications/${PN}.desktop

	# install application icons
	insinto /usr/share/icons
	doins -r share/icons/hicolor

	# install default icon
	insinto /usr/share/pixmaps
	doins share/icons/hicolor/48x48/apps/${PN}.png

	# install documentation, but no license file
	dodoc share/doc/${PN}/FAQ.pdf
	dodoc share/doc/${PN}/Readme.txt

	# install binary
	into /opt/${PN}
	dobin bin/*

	# install libraries
	dolib.so lib/lib*.so*

	# install programs
	exeinto /opt/mendeleydesktop/$(get_libdir)/mendeleydesktop/libexec
	doexe lib/mendeleydesktop/libexec/*

	# install shared files
	insinto /opt/${PN}/share
	doins -r share/mendeleydesktop

	# make symbolic to known location
	dosym /opt/${PN}/bin/${PN} /opt/bin/${PN}
}
