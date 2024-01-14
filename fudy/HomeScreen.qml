import QtQuick 2.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0
import note_screen 1.0
import plan_screen 1.0
import todo_screen 1.0
import workspace_screen 1.0

Item {
	id: root
	width: 800
	height: 658

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
				font: FudyFont.keyLarge
				text: name
			}

			MouseArea {
				anchors.fill: parent
				onClicked: {
					switch(model.name)
					{
					case "NOTE" : internal.openApplication(noteScreenView); break
					case "PLAN" : internal.openApplication(planScreenView); break
					case "WORKSPACE" : internal.openApplication(workspaceScreenView); break
					case "TODO" : internal.openApplication(todoScreenView); break;
					default :internal.openApplication("")
					}
				}
			}
		}

	}

	//TODO: Remove to C++ model in next ticket
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

	NoteScreen {
		id: noteScreenView
	}
	PlanScreen {
		id: planScreenView
	}
	WorkspaceScreen {
		id: workspaceScreenView
	}
	TodoScreen {
		id: todoScreenView
	}
	//ENDTODO

	QtObject {
		id: internal

		function openApplication(item) {
			root.parent.push(item)
		}
	}
}
