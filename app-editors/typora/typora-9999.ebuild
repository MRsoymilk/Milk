# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Markdown Editor"
HOMEPAGE="https://typora.io"
SRC_URI="https://typora.io/linux/Typora-linux-x64.tar.gz -> typora-${PV}-linux-x64.tar.gz"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="
	x11-libs/libXScrnSaver
	${DEPEND}
"
BEPEND=""

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	S=${WORKDIR}/bin/Typora-linux-x64/
}

src_install() {
	insinto /opt/
	doins -r ${S}
	dosym /opt/Typora-linux-x64/Typora /usr/bin/Typora
	fperms 0755 /opt/Typora-linux-x64/Typora
	fperms 4755 /opt/Typora-linux-x64/chrome-sandbox
	insinto /usr/share/applications/
	doins ${FILESDIR}/Typora.desktop
}

pkg_postinst() {
	update-desktop-database
}
