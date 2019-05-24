# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="GPDPocket Specific udev rules."

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* amd64 x86"

S="${WORKDIR}"
inherit udev

src_install() {
udev_dorules "/home/kmyers/Workspace/ChromiumOS/src/overlays/overlay-gpdpocket/eclass/files/40-gpdpocket-touchscreen.rules"

}
