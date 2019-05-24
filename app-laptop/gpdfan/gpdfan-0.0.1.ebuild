# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit python-single-r1


DESCRIPTION="Small python daemon to manage the fan in a gpd pocket."
HOMEPAGE="https://github.com/vStone/gentoo-gpd-overlay"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_unpack() {
	mkdir -p "${WORKDIR}/gpdfan-${PV}"
	cp -v "${FILESDIR}/gpd-fan-${PV}.py" "${WORKDIR}/gpdfan-${PV}/gpd-fan" || die "Sources not found"
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	dobin 'gpd-fan'
}
