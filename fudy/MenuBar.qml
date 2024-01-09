import QtQuick 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

Rectangle {
	id: root
	property bool isShownMenuBar: false
	signal iconClicked

	width: 800
	height: 58
	color: FudyColor.layer3
	visible: isShownMenuBar

	Image {
		id: icon
		x: 13
		y: 13
		width: 40
		height: 37
		source: "qrc:/image/icons_fudy.png"

		MouseArea {
			anchors.fill: icon
			onClicked: {
				iconClicked();
			}
		}
	}

	RowLayout {
		id: toolIcons
		width: 295
		height: 30
		anchors {
			verticalCenter: parent.verticalCenter
			right: parent.right
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/home.svg"
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/search.svg"
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/plus.svg"
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/bell.svg"
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/settings.svg"
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/menu-dots-vertical.svg"
		}
	}
}
