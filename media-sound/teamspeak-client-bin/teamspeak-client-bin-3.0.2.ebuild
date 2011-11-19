# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

MY_PV="${PV/_/-}"

DESCRIPTION="TeamSpeak Client - Voice Communication Software"
HOMEPAGE="http://teamspeak.com/"
SRC_URI="amd64? ( http://ftp.4players.de/pub/hosted/ts3/releases/${MY_PV}/TeamSpeak3-Client-linux_amd64-${MY_PV}.run )
	x86? ( http://ftp.4players.de/pub/hosted/ts3/releases/${MY_PV}/TeamSpeak3-Client-linux_x86-${MY_PV}.run )"

LICENSE="teamspeak3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sdk"

RESTRICT="mirror"
PROPERTIES="interactive"

DEPEND="app-admin/chrpath"
RDEPEND=">=x11-libs/qt-core-4.7
	>=x11-libs/qt-gui-4.7
	>=x11-libs/libXinerama-1.0.2"

QA_PRESTRIPPED="/opt/teamspeak3-client/ts3client
	/opt/teamspeak3-client/soundbackends/libalsa_linux_amd64.so
	/opt/teamspeak3-client/soundbackends/libpulseaudio_linux_amd64.so"

src_unpack() {
	# TODO: unpack_makeself -- use this version once it supports makeself 2.1.6
	sh "${DISTDIR}"/${A} --target "${WORKDIR}"/${P} || die "unpack failed"
}

src_prepare() {
	# remove Qt libraries
	rm -r accessible imageformats libQt* || die

	# remove useless runscript
	rm ts3client_runscript.sh || die

	if ! use sdk ; then
		rm -r pluginsdk || die
	fi

	# assign an architecture independent name
	mv ts3client_linux_* ts3client || die

	# fix the rpath security issue
	chrpath --delete error_report package_inst update
}

src_install() {
	local dest="${ED}"/opt/teamspeak3-client

	mkdir -p "${dest}" || die

	cp -R * "${dest}" || die

	exeinto /opt/bin
	doexe "${FILESDIR}"/teamspeak3

	make_desktop_entry teamspeak3 TeamSpeak3 \
		/opt/teamspeak3-client/gfx/default/24x24_connect.png Network
}
