# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="SOLIVER"

inherit perl-module

DESCRIPTION="Capture output from XML::Writer"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

DEPEND=""
RDEPEND="dev-perl/XML-Writer"

SRC_TEST="do"
