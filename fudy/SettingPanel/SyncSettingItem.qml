import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

SettingItem {
	id: root

	headerText: qsTr("Sign in") + Translator.language

	contentComponent: ColumnLayout {
		spacing: 14

		Text {
			Layout.fillWidth: true
			font: FudyFont.text3
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			text: qsTr("Sign in to sync your notes to the cloud.") + Translator.language
		}

		FudyButton {
			font: FudyFont.text3

			text: qsTr("Sign in") + Translator.language
		}
	}
}
