import QtQuick 2.15
import QtQuick.Layouts 1.15

import "NoteScreen/Component"
import "./SettingPanel"

import Fudy.style.singleton 1.0

Rectangle {
	id: root
	property bool isShownMenuBar: false
	signal exitIconClicked()
	signal fudyIconClicked()

	width: parent.width
	height: internal.headerHeight
	radius: internal.radius
	color: FudyColor.background8

	Rectangle {
		width: parent.width
		height: internal.radius
		anchors.bottom: root.bottom
		color: root.color
	}

	Image {
		id: fudyIcon
		width: 25
		height: 28
		anchors {
			left: root.left
			leftMargin: 10
			verticalCenter: root.verticalCenter
		}
		fillMode: Image.PreserveAspectFit
		source: internal.fudyIconSource

		MouseArea {
			anchors.fill: parent
			onClicked: function() {
				root.fudyIconClicked();
			}
		}
	}

	RowLayout {
		id: toolIcons
		spacing: 15
		anchors {
			verticalCenter: parent.verticalCenter
			right: parent.right
			rightMargin: 15
		}
		MenuBarItem {
			sourceUrl: internal.settingIconSource
			MouseArea {
				anchors.fill: parent

				onClicked: function() {
					settingPopup.open();
				}
			}

			SettingPopup {
				id: settingPopup
			}
		}
		MenuBarItem {
			sourceUrl: internal.exitIconSource
			MouseArea {
				anchors.fill: parent

				onClicked: function() {
					root.exitIconClicked();
				}
			}
		}
	}

	QtObject {
		id: internal

		property int headerHeight: 35
		property int radius: 8

		property string exitIconSource: "qrc:/image/exit.svg"
		property string settingIconSource: "qrc:/image/settings.svg"
		property string fudyIconSource: "qrc:/image/icons_fudy.png"
	}
}
