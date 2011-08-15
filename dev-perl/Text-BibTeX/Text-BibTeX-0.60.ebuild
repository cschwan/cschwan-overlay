# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="AMBS"
MODULE_SECTION="Text"

inherit perl-module

DESCRIPTION="Text::BibTeX is a Perl library for reading, parsing, and processing BibTeX files"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="virtual/perl-Module-Build
	dev-perl/Config-AutoConf
	dev-perl/ExtUtils-LibBuilder"
RDEPEND="dev-perl/Capture-Tiny"

SRC_TEST="do"
