import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	function openApplication(url) {
		parent.push(url)
	}

	anchors.fill: parent

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

			MouseArea {
				anchors.fill: parent
				onClicked: {
					switch(model.name)
					{
					case "NOTE" : openApplication("qrc:/NoteScreen.qml"); break
					case "PLAN" : openApplication("qrc:/PlanScreen.qml"); break
					case "WORKSPACE" : openApplication("qrc:/WorkSpace.qml"); break
					case "TODO" : openApplication("qrc:/TodoScreen.qml")
					}
				}
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
