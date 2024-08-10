import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../SettingPanel"

import Fudy.style.singleton 1.0

FudyPopup {
	id: root
	implicitWidth: 325

	signal deleteItem()

	contentComponent: ColumnLayout {
		spacing: 12

		Text {
			id: deleteText
			Layout.leftMargin: 10
			Layout.fillWidth: true
			font: FudyFont.text2
			color: FudyColor.fontColor2
			wrapMode: Text.Wrap
			text: qsTr("Do you want to delete this note?") + Translator.language
		}

		CheckBox {
			Layout.leftMargin: 20
			font: FudyFont.text2
			text: qsTr("Don’t show again") + Translator.language
		}

		RowLayout {
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignRight
			Layout.rightMargin: 20
			spacing: 10

			FudyButton {
				text: qsTr("Delete") + Translator.language
				onClicked: {
					root.deleteItem();
				}
			}

			FudyButton {
				text: qsTr("Keep") + Translator.language

				onClicked: function() {
					root.close();
				}
			}
		}
	}
}
