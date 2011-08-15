# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="DROLSKY"

inherit perl-module

DESCRIPTION="Combines List::Util and List::MoreUtils in one bite-sized package"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="virtual/perl-Module-Build"
RDEPEND=">=dev-perl/List-MoreUtils-0.22"

SRC_TEST="do"
