# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit latex-package

DESCRIPTION="Reimplementation of the bibliographic facilities provided by LaTeX"
HOMEPAGE="http://www.ctan.org/tex-archive/macros/latex/contrib/biblatex"
SRC_URI="http://www.students.uni-mainz.de/cschwan/${P}.zip"

LICENSE="LPPL-1.3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}/${PN}"

src_install() {
	insinto /usr/share/texmf-site/tex/latex/${PN}
	doins -r latex/*

	for i in bibtex/* ; do
		insinto /usr/share/texmf-site/${i}/${PN}
		doins ${i}/*
	done

	if use doc ; then
		pushd doc
		latex-package_src_doinstall doc
		popd
	fi

	dodoc README RELEASE
}
