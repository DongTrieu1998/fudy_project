import QtQuick
import QtQuick.Layouts

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

SettingItem {
	id: root

	headerText: qsTr("Theme") + Translator.language

	contentComponent: ColumnLayout {
		spacing: 10

		RadioButton {
			text: qsTr("Light") + Translator.language
			checked: true
		}

		RadioButton {
			text: qsTr("Dark") + Translator.language
		}
	}
}
