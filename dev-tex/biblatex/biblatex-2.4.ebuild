# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit latex-package

DESCRIPTION="Reimplementation of the bibliographic facilities provided by LaTeX"
HOMEPAGE="http://www.ctan.org/tex-archive/macros/latex/contrib/biblatex"
SRC_URI="mirror://sourceforge/${PN}/${P}.tds.tgz"

LICENSE="LPPL-1.3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

RESTRICT="mirror"

RDEPEND="dev-texlive/texlive-bibtexextra"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/texmf-site
	doins -r bibtex tex

	dodoc doc/latex/biblatex/{README,RELEASE}

	if use doc ; then
		pushd doc/latex/biblatex/
		latex-package_src_doinstall doc
		popd
	fi

	if use examples ; then
		docinto examples
		dodoc -r doc/latex/biblatex/examples
	fi
}
