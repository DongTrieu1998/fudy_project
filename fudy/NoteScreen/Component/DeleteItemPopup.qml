import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../../SettingPanel"

import Fudy.style.singleton 1.0

FudyPopup {
	id: root

	signal deleteItem()

	implicitWidth: 325

	contentComponent: ColumnLayout {
		spacing: 12

		Text {
			id: deleteText
			Layout.alignment: Qt.AlignHCenter
			font: FudyFont.text2
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			text: qsTr("Do you want to delete this note?")
		}

		CheckBox {
			Layout.leftMargin: 20
			font: FudyFont.text2
			text: qsTr("Don’t show again")
		}

		RowLayout {
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignRight
			Layout.rightMargin: 20
			spacing: 10

			FudyButton {
				text: qsTr("Delete")
				onClicked: {
					root.deleteItem();
				}
			}

			FudyButton {
				text: qsTr("Keep")

				onClicked: function() {
					root.close();
				}
			}
		}
	}
}
