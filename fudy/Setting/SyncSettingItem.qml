import QtQuick 2.15

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

Item {
	id: root
	height: 60

	Text {
		id: message

		anchors {
			left: root.left
			leftMargin: 16
		}
		font: FudyFont.text3

		text: qsTr("Sign in to sync your notes to the cloud.")
	}

	FudyButton {
		id: syncButton
		width: 86
		height: 27
		font: FudyFont.text3

		anchors {
			left: root.left
			leftMargin: 16
			top: message.bottom
			topMargin: 14
		}

		text: qsTr("Sign in")
	}

}
