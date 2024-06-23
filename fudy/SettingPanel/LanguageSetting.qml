import QtQuick 2.15
import QtQuick.Layouts 1.15

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
