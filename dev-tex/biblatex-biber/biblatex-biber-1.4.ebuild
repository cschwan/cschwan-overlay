# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit perl-app

DESCRIPTION="Biber is a BibTeX replacement for users of biblatex"
HOMEPAGE="http://biblatex-biber.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${PV}/${PN}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( Artistic-2 GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

RDEPEND=">=dev-lang/perl-5.14
	dev-perl/Business-ISBN
	dev-perl/Business-ISSN
	dev-perl/Business-ISMN
	dev-perl/Data-Compare
	dev-perl/Data-Diver
	dev-perl/Data-Dump
	dev-perl/Date-Simple
	dev-perl/File-Slurp-Unicode
	dev-perl/IPC-Run3
	dev-perl/libwww-perl[ssl]
	dev-perl/List-AllUtils
	dev-perl/Log-Log4perl
	dev-perl/Mozilla-CA
	dev-perl/regexp-common
	dev-perl/Readonly
	dev-perl/Readonly-XS
	>=dev-perl/Text-BibTeX-0.660.0
	dev-perl/URI
	dev-perl/XML-LibXML-Simple
	dev-perl/XML-LibXSLT
	=dev-tex/biblatex-2.4
	virtual/perl-IPC-Cmd"
DEPEND="${RDEPEND}
	test? ( dev-perl/File-Which )
	virtual/perl-Module-Build"

# >=dev-perl/Unicode-Collate-0.900" - is part of perl itself
# dev-perl/ExtUtils-LibBuilder
# dev-perl/Config-AutoConf
# dev-perl/List-MoreUtils

SRC_TEST="parallel"
