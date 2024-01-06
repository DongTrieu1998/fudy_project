import QtQuick 2.15

Rectangle {

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
			anchors.fill: parent
			onClicked: {
				iconClicked()
			}
		}
	}

	Row {
		spacing: 23
		anchors {
			verticalCenter: parent.verticalCenter
			right: parent.right
		}
		Image {
			width: 30
			height: 30
			source: "qrc:/image/home.svg"
		}
		Image {
			width: 30
			height: 30
			source: "qrc:/image/search.svg"
		}
		Image {
			width: 30
			height: 30
			source: "qrc:/image/plus.svg"
		}
		Image {
			width: 30
			height: 30
			source: "qrc:/image/bell.svg"
		}
		Image {
			width: 30
			height: 30
			source: "qrc:/image/settings.svg"
		}
		Image {
			width: 30
			height: 30
			source: "qrc:/image/menu-dots-vertical.svg"
		}
	}
}
