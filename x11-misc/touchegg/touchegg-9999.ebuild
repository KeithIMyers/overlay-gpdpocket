# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 qmake-utils

DESCRIPTION="Linux multitouch gesture recognizer"
HOMEPAGE="https://github.com/JoseExposito/touchegg"
SRC_URI="
gpdconfig? ( https://raw.githubusercontent.com/nexus511/gpd-ubuntu-packages/master/packages/gpdpocket-touchegg-config/files/touchegg.conf -> gpd-touchegg.conf )"

EGIT_REPO_URI="git://github.com/JoseExposito/touchegg.git https://github.com/JoseExposito/touchegg.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gpdconfig"

RDEPEND="
    dev-qt/qtcore:4
	dev-qt/qtgui:4
	x11-libs/libXtst
	x11-libs/geis
"
DEPEND="${RDEPEND}"

src_unpack() {
	git-r3_src_unpack
	use gpdconfig && (
		mv -v "${WORKDIR}/${P}/installation/touchegg.conf" "${WORKDIR}/${P}/installation/touchegg.conf.orig"
		cp -v "${DISTDIR}/gpd-touchegg.conf" "${WORKDIR}/${P}/installation/touchegg.conf"
	)
}

src_configure() {
	eqmake4 ${PN}.pro
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install
	einstalldocs
}
