# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit perl-app

DESCRIPTION="Biber is a BibTeX replacement for users of biblatex"
HOMEPAGE="http://biblatex-biber.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${PV}/${PN}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

DEPEND="virtual/perl-Module-Build
	>=dev-perl/ExtUtils-LibBuilder-0.02
	test? ( >=dev-perl/Test-Pod-1.22
	>=dev-perl/Test-Pod-Coverage-1.08 )"
RDEPEND="dev-perl/config-general
	dev-perl/Data-Dump
	dev-perl/Data-Compare
	dev-perl/Date-Simple
	dev-perl/File-Slurp-Unicode
	dev-perl/IPC-Run3
	dev-perl/List-AllUtils
	dev-perl/regexp-common
	dev-perl/Log-Log4perl
	dev-perl/Readonly
	dev-perl/Readonly-XS
	>=dev-perl/Unicode-Collate-0.74
	dev-perl/XML-LibXML-Simple
	>=dev-perl/Text-BibTeX-0.55
	dev-perl/libwww-perl"

S="${WORKDIR}/${PN}-v${PV}"

SRC_TEST="do"
