import QtQuick
import QtQuick.Layouts

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

SettingItem {
	id: root

	headerText: qsTr("Languages")

	contentComponent: ColumnLayout {
		spacing: 10

		RadioButton {
			text: qsTr("Vietnamese")
			checked: true
		}

		RadioButton {
			text: qsTr("English")
		}

		RadioButton {
			text: qsTr("Japanese")
		}
	}
}
