# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_4,3_5,3_6,3_7} )

inherit python-any-r1

DESCRIPTION="An implementation of the GEIS (Gesture Engine Interface and Support) interface."
HOMEPAGE="https://launchpad.net/geis"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.xz"

LICENSE="GPL-2 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="evemu test"

RDEPEND="
  x11-libs/libxcb
  x11-libs/grail[evemu?]
  ${PYTHON_DEPS}
"
DEPEND="
 ${RDEPEND}
 test? ( dev-cpp/gtest )
"

src_configure() {
	econf $(use_with evemu)
}
