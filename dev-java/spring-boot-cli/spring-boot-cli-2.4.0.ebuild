# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="https://docs.spring.io/spring-boot/docs/current/reference/html/spring-boot-cli.html#cli"
SRC_URI="https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.4.0/${P}-bin.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND=""

RDEPEND=">=virtual/jre-1.8
  ${CP_DEPEND}"
DEPEND=">=virtual/jdk-1.8
  ${CP_DEPEND}"

src_unpack() {
}

src_install() {
	insinto /opt/
	doins -r ${S}
}
