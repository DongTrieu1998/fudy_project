import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../SettingPanel"

import Fudy.style.singleton 1.0

FudyPopup {
	id: root
	implicitWidth: 325

	property string popupText: ""
	signal popupContentChanged(string popupContent)

	headerText: qsTr("Header") + Translator.language

	contentComponent: ColumnLayout {
		spacing: 12

		TextField {
			id: textField
			Layout.fillWidth: true
			Layout.margins: 5
			font: FudyFont.text2
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			maximumLength: 255
			placeholderText: qsTr("Enter your Note's header") + Translator.language
			text: root.popupText

			onEditingFinished: function() {
				if (textField.text.length == 0) {
					textField.text = root.popupText;
				}
			}

			Keys.onEnterPressed: {
				if (textField.text.length == 0) {
					textField.text = root.popupText;
					focus = false;
				}
			}
		}

		RowLayout {
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignRight
			Layout.rightMargin: 20
			spacing: 10

			FudyButton {
				text: qsTr("Accept") + Translator.language

				onClicked: function() {
					root.popupContentChanged(textField.text);
					close();
				}
			}

			FudyButton {
				text: qsTr("Cancel") + Translator.language

				onClicked: function() {
					close();
				}
			}
		}
	}
}
