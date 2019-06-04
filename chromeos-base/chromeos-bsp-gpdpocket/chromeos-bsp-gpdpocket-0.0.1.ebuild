# Keith I Myers - https://kmyers.me
# Distributed under the terms of the GNU General Public License v2

EAPI=4

#inherit cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="GPL"
SLOT="0"
KEYWORDS="-* amd64 x86"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND=""

DEPEND="${RDEPEND}"

src_install() {
    insinto "/etc/modprobe.d"
    doins "${FILESDIR}/gpd-blacklist.conf"
}
