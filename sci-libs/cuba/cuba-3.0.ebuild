# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MY_P="Cuba-${PV}"

inherit autotools-utils

DESCRIPTION="A library for multidimensional numerical integration"
HOMEPAGE="http://www.feynarts.de/cuba/"
SRC_URI="http://www.feynarts.de/cuba/${MY_P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"
