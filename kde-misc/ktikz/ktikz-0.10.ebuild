# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

KDE_HANDBOOK="optional"

inherit kde4-base

DESCRIPTION="Editor for the TikZ language"
HOMEPAGE="http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language"
SRC_URI="http://www.hackenberger.at/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="app-text/poppler[qt4]
	kde-base/kdelibs"
RDEPEND="${DEPEND}
	dev-tex/pgf
	dev-texlive/texlive-latexextra
	virtual/latex-base"

S="${WORKDIR}/${PN}"
