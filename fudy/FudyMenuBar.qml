import QtQuick 2.15
import QtQuick.Layouts 1.15

import "NoteScreen/Component"
import "Setting"

import Fudy.style.singleton 1.0

Rectangle {
	id: root
	property bool isShownMenuBar: false
	signal iconClicked

	width: parent.width
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
		spacing: 17
		anchors {
			verticalCenter: parent.verticalCenter
			right: parent.right
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/settings.svg"
			MouseArea {
				anchors.fill: parent

				onClicked: {
					settingPopup.open()
				}
			}

			SettingPopup {
				id: settingPopup
			}
		}
		MenuBarItem {
			sourceUrl: "qrc:/image/menu-dots-vertical.svg"
		}
	}
}
