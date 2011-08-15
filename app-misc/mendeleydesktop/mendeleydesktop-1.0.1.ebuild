# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils versionator

if use amd64 ; then
	LNXARCH="linux-x86_64"
elif use x86 ; then
	LNXARCH="linux-i486"
fi

DESCRIPTION="A free research management tool for desktop and web"
HOMEPAGE="http://www.mendeley.com/"
SRC_URI="http://www.mendeley.com/downloads/linux/${P}-${LNXARCH}.tar.bz2"

LICENSE="Mendeley-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND=">=x11-libs/qt-core-4.6
	>=x11-libs/qt-gui-4.6
	>=x11-libs/qt-svg-4.6
	>=x11-libs/qt-webkit-4.6
	>=x11-libs/qt-xmlpatterns-4.6"

S="${WORKDIR}/${PN}-$(get_version_component_range 1-2)-${LNXARCH}"

QA_PRESTRIPPED="
	/opt/mendeleydesktop/lib/mendeleydesktop/libexec/mendeleydesktop.x86_64
	/opt/mendeleydesktop/lib/mendeleydesktop/libexec/Updater
	/opt/mendeleydesktop/lib/libPDFNetC.so
	/opt/mendeleydesktop/lib/libMendeley.so.1.0.0"

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
}

src_install() {
	# install menu
	domenu share/applications/${PN}.desktop

	# install application icons
	insinto /usr/share/icons
	doins -r share/icons/hicolor

	# installdefault icon
	insinto /usr/share/pixmaps
	doins share/icons/hicolor/48x48/apps/${PN}.png

	# install documentation, but no license file
	dodoc share/doc/${PN}/FAQ.pdf
	dodoc share/doc/${PN}/Readme.txt

	# install binary
	into /opt/${PN}
	dobin bin/*

	# TODO: this is bad style. portage helper(s) should be used instead of mv
	mv lib "${D}"/opt/${PN} || die "failed to move directory"

	# install shared files
	insinto /opt/${PN}/share
	doins -r share/mendeleydesktop

	# make symbolic to known location
	dosym /opt/${PN}/bin/${PN} /opt/bin/${PN}
}
