# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="DAVID"

inherit perl-module

DESCRIPTION="Reading/Writing of Complete Files with Character Encoding Support"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="virtual/perl-Module-Build"
RDEPEND="dev-perl/File-Slurp"

SRC_TEST="do"
