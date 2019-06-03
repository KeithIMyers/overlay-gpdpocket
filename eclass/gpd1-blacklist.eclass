# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="GPDPocket Module Blacklist"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* amd64 x86"

S="${WORKDIR}"
src_install() {
    insinto "/etc/modprobe.d"
    doins "${FILESDIR}/gpd-blacklist.conf"
}
