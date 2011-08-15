# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="MARKOV"

inherit perl-module

DESCRIPTION="XML::LibXML clone of XML::Simple::XMLin()"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

DEPEND="test? ( >=dev-perl/Test-Pod-1.00 )"
RDEPEND=">=dev-perl/XML-LibXML-1.64
	dev-perl/File-Slurp
	virtual/perl-Pod-Simple"

SRC_TEST="do"
