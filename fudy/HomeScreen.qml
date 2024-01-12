import QtQuick 2.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0

Item {
	id: root
	anchors.fill: parent

	Image {
		id: iconImage
		anchors {
			top: root.top
			horizontalCenter: root.horizontalCenter
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
			horizontalCenter: root.horizontalCenter
		}
		spacing: 25

		model: buttonModel
		delegate: Rectangle {
			width: 477
			height: 77
			radius: 30
			color: FudyColor.layer1
			Text {
				id: buttonName
				anchors.centerIn: parent
				color: FudyColor.fontColor1
				font.family: "Ragular"
				font.pointSize: 40
				text: name
			}

			MouseArea {
				anchors.fill: parent
				onClicked: {
					switch(model.name)
					{
					case "NOTE" : internal.openApplication("D:/TEST/fudy_project/fudy/NoteScreen/my/plugin/example/NoteScreen.qml"); break
					case "PLAN" : internal.openApplication("qrc:/PlanScreen.qml"); break
					case "WORKSPACE" : internal.openApplication("qrc:/WorkSpace.qml"); break
					case "TODO" : internal.openApplication("qrc:/TodoScreen.qml"); break;
					default :internal.openApplication("")
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

	QtObject {
		id: internal

		function openApplication(url) {
			root.parent.push(url)
		}
	}
}
