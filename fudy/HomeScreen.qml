import QtQuick 2.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0

Item {
	id: root
	anchors.fill: parent

	Text {
		id: title
		anchors {
			top: root.top
			left: root.left
			leftMargin: 69
		}

		font: FudyFont.heading1
		horizontalAlignment: Text.AlignHCenter
		color: FudyColor.fontColor2

		text: qsTr("Fudy")
	}

	ListView {
		id: buttonListview
		width: 348
		height: 320
		anchors {
			top: title.bottom
			topMargin: 18
			left: root.left
			leftMargin: 56
		}
		spacing: 16

		model: buttonModel
		delegate: Rectangle {
			width: 348
			height: 68
			radius: 8
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
					internal.openApplication("qrc:/NoteScreen/NoteScreen.qml");
				}
			}
		}

	}

	Image {
		id: stickNoteImg
		anchors.left: root.left
		anchors.leftMargin: 316
		source: "qrc:/image/stick_note_3d.png"
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

	QtObject {
		id: internal

		function openApplication(item) {
			root.parent.push(item)
		}
	}
}
