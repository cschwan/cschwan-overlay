# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="AMBS"
MODULE_SECTION="ExtUtils"
MODULE_VERSION="0.04"

inherit perl-module

DESCRIPTION="A module to implement some of AutoConf macros in pure perl"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

RDEPEND=">=virtual/perl-ExtUtils-CBuilder-0.230.0
	virtual/perl-File-Spec
	virtual/perl-File-Temp"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.360.0
	test? ( dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage )"

SRC_TEST="do"
