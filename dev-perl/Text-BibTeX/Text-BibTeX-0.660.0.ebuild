# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="AMBS"
MODULE_SECTION="Text"
MODULE_VERSION="0.66"

inherit perl-module

DESCRIPTION="Text::BibTeX is a Perl library for reading, parsing, and processing BibTeX files"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=">=dev-perl/Config-AutoConf-0.160.0
	>=dev-perl/ExtUtils-LibBuilder-0.020.0
	>=virtual/perl-ExtUtils-CBuilder-0.27
	>=virtual/perl-Module-Build-0.36.03"
RDEPEND="!dev-libs/btparse
	>=dev-perl/Capture-Tiny-0.060.0"

SRC_TEST="do"
