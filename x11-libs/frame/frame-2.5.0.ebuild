# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Groups touches from the same device occurring on the same window together"
HOMEPAGE="https://launchpad.net/frame"
SRC_URI="https://launchpad.net/${PN}/trunk/v${PV}/+download/${P}.tar.xz"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="evemu"

RDEPEND="evemu? ( app-misc/evemu )"
DEPEND="${RDEPEND}"

src_configure() {
	econf $(use_enable evemu)
}
