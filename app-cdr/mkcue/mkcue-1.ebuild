# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="mkcue generates cue sheets from a CD's TOC"
HOMEPAGE="https://diplodocus.org/projects/audio/"
SRC_URI="https://diplodocus.org/dist/audio/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	# make install does not work because target directory does not exist
	dobin mkcue
	dodoc README
}
