import QtQuick
import QtQuick.Layouts

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

SettingItem {
	id: root

	headerText: qsTr("General") + Translator.language

	contentComponent: ColumnLayout {
		spacing: 14

		TextWithToggle {
			contentText: qsTr("enabled insights") + Translator.language
			toggleText: qsTr("Off") + Translator.language

			onToggleClicked: function(checked) {
				toggleText = checked ? qsTr("On") + Translator.language : qsTr("Off") + Translator.language;
			}
		}

		TextWithToggle {
			contentText: qsTr("Confirm before delete") + Translator.language
			toggleText: qsTr("Off") + Translator.language

			onToggleClicked: function(checked) {
				toggleText = checked ? qsTr("On") + Translator.language : qsTr("Off") + Translator.language;
			}
		}
	}
}
