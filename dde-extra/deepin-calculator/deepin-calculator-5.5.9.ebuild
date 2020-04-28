# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit qmake-utils

DESCRIPTION="An easy to use Calculator for Deepin"
HOMEPAGE="https://github.com/linuxdeepin/calculator"
MY_PN=${PN#*-}
MY_P=${MY_PN}-${PV}
SRC_URI="https://github.com/linuxdeepin/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-qt/qtcore:5
		 dev-qt/qtwidgets:5
		 dev-qt/qtgui:5
		 dev-qt/qtsvg:5
		 "

DEPEND="${RDEPEND}
		>=dde-base/dtkwidget-2.0.0:=
		dev-qt/linguist-tools
		dev-qt/qtchooser
		virtual/pkgconfig
		"

src_prepare() {
	eapply_user
	QT_SELECT=qt5 eqmake5 PREFIX=/usr  DEFINES+="VERSION=${PV}"
}

src_install() {
	emake INSTALL_ROOT=${D} install
}
