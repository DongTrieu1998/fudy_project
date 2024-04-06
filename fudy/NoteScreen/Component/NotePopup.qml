import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

FudyPopup {
	id: root
	implicitWidth: 325

	headerText: qsTr("Header")

	contentComponent: ColumnLayout {
		spacing: 12

		TextArea {
			Layout.fillWidth: true
			font: FudyFont.text2
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			placeholderText: qsTr("Enter your Note's header")
		}

		RowLayout {
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignRight
			Layout.rightMargin: 34
			spacing: 10

			FudyButton {
				text: qsTr("Accept")
			}

			FudyButton {
				text: qsTr("Cancel")

				onClicked: {
					close()
				}
			}
		}
	}

}
