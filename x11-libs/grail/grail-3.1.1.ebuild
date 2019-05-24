# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Gesture Recognition And Instantiation Library"
HOMEPAGE="https://launchpad.net/grail"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="evemu"

RDEPEND="
	evemu? ( app-misc/evemu )
	x11-libs/frame[evemu?]
"
DEPEND="${RDEPEND}"

src_configure() {
	econf $(use_enable evemu)
}
