# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

MODULE_AUTHOR="NEZUMI"
MODULE_VERSION="2012.10"

inherit perl-module

DESCRIPTION="UAX #14 Unicode Line Breaking Algorithm"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

RDEPEND="virtual/perl-Encode
	dev-perl/MIME-Charset"
DEPEND="${RDEPEND}"

SRC_TEST="do"
