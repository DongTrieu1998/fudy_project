import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../../Setting"

import Fudy.style.singleton 1.0

FudyPopup {
	id: root
	implicitWidth: 325

	headerText: qsTr("Header")

	contentComponent: ColumnLayout {
		spacing: 12

		TextField {
			id: as
			Layout.fillWidth: true
			Layout.margins: 5
			font: FudyFont.text2
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			maximumLength: 255
			placeholderText: qsTr("Enter your Note's header")

			Component.onCompleted: {
				console.log("implicitBackgroundWidth : " + implicitBackgroundWidth)
				console.log("background : " + background.width)
				console.log("width : " + width)
				console.log("width 2 : " +  as.rightPadding)
			}
		}

		RowLayout {
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignRight
			Layout.rightMargin: 20
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
