import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
	width: 800
	height: 600
	minimumWidth: width
	maximumWidth: width
	minimumHeight: height
	maximumHeight: height

	visible: true
	title: qsTr("Fudy Project")

	background: Rectangle {
		anchors.fill: parent
		color: "#B447CC"
	}

	Image {
		id: iconImage
		width: 200.44
		height: 208
		x:300
		y:92
		source: "qrc:/image/icons_fudy.png"
	}

	Text {
		id: text
		width: 280
		height: 110
		x: 243
		y: 320
		font {
			family: "Italianno"
			pixelSize: 128
		}
		horizontalAlignment: Text.AlignHCenter
		color: "#275910"

		text: qsTr("Fudy")
	}
}
