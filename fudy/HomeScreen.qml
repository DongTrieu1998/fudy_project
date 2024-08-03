import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects

import Fudy.style.singleton 1.0

Item {
	id: root
	width: 800
	height: 643

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
			border {
				width: 4
				color: FudyColor.layer11
			}

			gradient: Gradient {
				GradientStop { position: 0.4; color: FudyColor.layer9 }
				GradientStop { position: 1; color: FudyColor.layer10 }
			}
			Text {
				id: buttonName
				anchors.centerIn: parent
				color: FudyColor.fontColor4
				font: FudyFont.keyLarge
				text: name
			}

			MouseArea {
				anchors.fill: parent
				onClicked: function() {
					internal.openApplication(UtilityWidget);
				}
			}
		}
	}

	Image {
		id: stickNoteImg
		anchors {
			bottom: root.bottom
			right: root.right
			bottomMargin: 40
		}
		source: "qrc:/image/stick_note_3d.png"
	}

	//TODO: Remove to C++ model in next ticket
	ListModel {
		id: buttonModel
		ListElement {
			name: qsTr("NOTE")
			UtilityWidget: "NoteScreen/NoteScreen.qml"
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
			window.screenLoader = item;
		}
	}

	Component.onCompleted: function() {
		window.backgroundColor = FudyColor.background1;

		var screenWidth = Screen.desktopAvailableWidth;
		var screenHeight = Screen.desktopAvailableHeight;

		// Calculate the position to center the window
		var x = (screenWidth - root.width) / 2;
		var y = (screenHeight - root.height) / 2;

		// Set the window position
		window.x = x;
		window.y = y;
	}
}
