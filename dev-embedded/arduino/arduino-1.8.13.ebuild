# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An open-source AVR electronics prototyping platform"
HOMEPAGE="https:/arduino.cc"
SRC_URI="https://downloads.arduino.cc/${P}-linux64.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_setup() {
	s="${WORKDIR}/Arduino-linux-x64" || die "wrong in setup"
}

src_install() {
	insinto /opt/
	doins -r ${S}
	dosym /opt/${P}/arduino /usr/bin/arduino
	fperms 0755 /opt/${P}/arduino
	insinto /usr/share/applications/
	doins ${FILESDIR}/arduino.desktop
}

pkg_postinst() {
	update-desktop-database
}
