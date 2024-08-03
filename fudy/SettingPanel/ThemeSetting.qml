import QtQuick
import QtQuick.Layouts

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

SettingItem {
	id: root

	headerText: qsTr("Theme")

	contentComponent: ColumnLayout {
		spacing: 10

		RadioButton {
			text: qsTr("Light")
			checked: true
		}

		RadioButton {
			text: qsTr("Dark")
		}
	}
}
