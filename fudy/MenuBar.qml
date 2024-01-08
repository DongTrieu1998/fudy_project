import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
	id: root
	property bool isShownMenuBar: false
	signal iconClicked

	width: 800
	height: 58
	color: "#FFDE00"
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

		spacing: 23
		Image {
			Layout.preferredWidth: 30
			Layout.preferredHeight: 30
			fillMode: Image.PreserveAspectCrop
			source: "qrc:/image/home.svg"
		}
		Image {
			Layout.preferredWidth: 30
			Layout.preferredHeight: 30
			fillMode: Image.PreserveAspectCrop
			source: "qrc:/image/search.svg"
		}
		Image {
			Layout.preferredWidth: 30
			Layout.preferredHeight: 30
			fillMode: Image.PreserveAspectCrop
			source: "qrc:/image/plus.svg"
		}
		Image {
			Layout.preferredWidth: 30
			Layout.preferredHeight: 30
			fillMode: Image.PreserveAspectCrop
			source: "qrc:/image/bell.svg"
		}
		Image {
			Layout.preferredWidth: 30
			Layout.preferredHeight: 30
			fillMode: Image.PreserveAspectCrop
			source: "qrc:/image/settings.svg"
		}
		Image {
			Layout.preferredWidth: 30
			Layout.preferredHeight: 30
			fillMode: Image.PreserveAspectCrop
			source: "qrc:/image/menu-dots-vertical.svg"
		}
	}
}
