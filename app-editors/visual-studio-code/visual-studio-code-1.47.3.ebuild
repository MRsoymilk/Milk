# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils pax-utils

EXEC_NAME=code
DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
BASE_URI="https://update.code.visualstudio.com/${PV}"
SRC_URI="${BASE_URI}/linux-x64/stable -> ${P}-amd64.tar.gz"
RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="libsecret"

RDEPEND="
	${DEPEND}
	>=net-print/cups-2.0.0
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	dev-libs/nss
	libsecret? ( app-crypt/libsecret[crypt] )
"

QA_PRESTRIPPED="opt/${PN}/code"
QA_PREBUILT="opt/${PN}/code"

pkg_setup(){
	use amd64 && S="${WORKDIR}/VSCode-linux-x64" || die "shouldn't be possibel with -* special keyword"
}

src_install(){
	dodir "/opt"
	cp -pPR "${S}" "${D}/opt/${PN}" || die "Failed to copy files"
	dosym "${EPREFIX}/opt/${PN}/bin/code" "/usr/bin/${EXEC_NAME}"
	make_desktop_entry "${EXEC_NAME}" "Visual Studio Code" "${PN}" "Development;IDE"
	newicon "${S}/resources/app/resources/linux/code.png" "${PN}.png"
}

pkg_postinst(){
	elog "to install additional utils, check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
