# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

MY_P="Cuba-${PV}"

inherit autotools-utils

DESCRIPTION="A library for multidimensional numerical integration"
HOMEPAGE="http://www.feynarts.de/cuba/"
SRC_URI="http://www.feynarts.de/cuba/${MY_P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="qt4"

RESTRICT="mirror"

DEPEND="qt4? ( x11-libs/qt-core
	x11-libs/qt-gui )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

PATCHES=(
	"${FILESDIR}"/${P}-configure.patch
	"${FILESDIR}"/${P}-makefile.patch
)

AUTOTOOLS_AUTORECONF=yes

myeconfargs=( $(use_enable qt4 qt) )
