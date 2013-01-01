# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="AMBS"
MODULE_SECTION="Config"
MODULE_VERSION="0.22"

inherit perl-module

DESCRIPTION="A module to implement some of AutoConf macros in pure perl"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

REPEND="dev-perl/Capture-Tiny
	>=virtual/perl-ExtUtils-CBuilder-0.23.00
	virtual/perl-Test-Simple"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker"

SRC_TEST="do"
