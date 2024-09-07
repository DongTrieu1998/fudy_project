import QtQuick
import QtQuick.Layouts

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

SettingItem {
	id: root

	headerText: qsTr("Languages") + Translator.language

	contentComponent: ColumnLayout {
		spacing: 10

		RadioButton {
			text: qsTr("Vietnamese") + Translator.language

			onCheckedChanged: function() {
				if (checked) {
					Translator.setLanguage(Translator.vi_VN);
				}
			}
		}

		RadioButton {
			text: qsTr("English") + Translator.language
			checked: true

			onCheckedChanged: function() {
				if (checked) {
					Translator.setLanguage(Translator.en_US);
				}
			}
		}

		RadioButton {
			text: qsTr("Japanese") + Translator.language

			onCheckedChanged: function() {
				if (checked) {
					Translator.setLanguage(Translator.ja_JP);
				}
			}
		}

		RadioButton {
			text: qsTr("Chinese") + Translator.language

			onCheckedChanged: function() {
				if (checked) {
					Translator.setLanguage(Translator.zh_CN);
				}
			}
		}
	}
}
