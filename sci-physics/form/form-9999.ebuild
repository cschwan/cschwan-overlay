# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

MY_P="${PN}cvs"

inherit autotools-utils

DESCRIPTION="FORM is a Symbolic Manipulation System"
HOMEPAGE="http://www.nikhef.nl/~form/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc mpi threads"

RESTRICT="mirror"

DEPEND="dev-libs/gmp
	sys-libs/zlib
	doc? ( virtual/latex-base )
	mpi? ( virtual/mpi )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

myeconfargs=(
	$(use_enable mpi parform)
	$(use_enable threads threaded)
)

AUTOTOOLS_AUTORECONF=yes

src_unpack() {
	wget -O ${MY_P}.tar.gz \
		http://www.nikhef.nl/~form/formcvs.php?dl=${MY_P}.tar.gz \
		|| die "failed to download FORM distribution"

	unpack ./${MY_P}.tar.gz
}

src_prepare() {
	sed -i 's:LINKFLAGS = -s:LINKFLAGS =:' sources/Makefile.am \
		|| die "failed to removing stripping"

	# TODO: fix C(XX)FLAGS

	autotools-utils_src_prepare
}

src_compile() {
	autotools-utils_src_compile

	if use doc ; then
		cd "${BUILD_DIR}"/doc/manual
		emake pdf

		DOCS=( "${BUILD_DIR}"/doc/manual/manual.pdf )
	fi
}
