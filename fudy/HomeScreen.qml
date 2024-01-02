import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	anchors.fill: parent
//	color: "#00017A"
	Image {
		id: iconImage
		anchors {
			top: parent.top
			horizontalCenter: parent.horizontalCenter
			topMargin: 34
		}
		width: 120
		height: 125
		source: "qrc:/image/icons_fudy.png"
	}

	ListView {
		id: buttonListview
		width: 477
		height: 383
		anchors{
			top: iconImage.bottom
			topMargin: 29
			horizontalCenter: parent.horizontalCenter
		}
		spacing: 25

		model: buttonModel
		delegate: Rectangle {
			width: 477
			height: 77
			radius: 30
			color: "#1237A1"
			Text {
				id: buttonName
				anchors.centerIn: parent
				color: "#ffffff"
				font.family: "Ragular"
				font.pointSize: 40
				text: name
			}
		}

	}

	ListModel {
		id: buttonModel
		ListElement {
			name: qsTr("NOTE")
		}
		ListElement {
			name: qsTr("PLAN")
		}
		ListElement {
			name: qsTr("WORKSPACE")
		}
		ListElement {
			name: qsTr("TODO")
		}
	}
}
