# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Xorg configuration for the gpd pocket"
HOMEPAGE="https://github.com/vStone/gentoo-gpd-overlay"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+touchegg"

DEPEND="
x11-base/xorg-server
x11-base/xorg-drivers[input_devices_libinput,video_cards_intel]
touchegg? ( x11-misc/touchegg[gpdconfig] )
"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -pv "${WORKDIR}/${P}"
}

src_install() {
	insinto "${EPREFIX}/etc/X11/xorg.conf.d"
	newins "${FILESDIR}/xorg-conf-d-intel-accel.conf" 20-intel.conf
	newins "${FILESDIR}/xorg-conf-d-monitor.conf" 40-monitor.conf
	newins "${FILESDIR}/xorg-conf-d-touchscreen.conf" 99-touchscreen.conf

 	insinto "${EPREFIX}/etc/udev/rules.d"
        doins "${FILESDIR}/99-goodix-touch.rules"
}
