import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0

Rectangle {
	id: delegate

	property var enabled
	property var header
	property var noteText

	signal removeCurrentItem
	signal headerEditted
	signal noteTextEditted

	width: noteScreenListView.width
	height: 102
	color: FudyColor.layer3
	border.width: 1
	border.color: FudyColor.layer5

	RowLayout {
		width: parent.width
		height: parent.height

		Image {
			id: checkbox
			Layout.preferredWidth : 30
			Layout.preferredHeight: 30
			Layout.leftMargin: 18
			fillMode: Image.PreserveAspectFit
			source: enabled ? "qrc:/image/checkbox (1).svg" : "qrc:/image/square-small.svg"

			MouseArea {
				anchors.fill: parent
				onClicked: {
					enabled = !enabled
				}
			}
		}

		Text {
			Layout.fillWidth: true
			font: FudyFont.text1
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			text: header

			MouseArea {
				anchors.fill: parent

				onClicked: {
					textPopup.open();
				}
			}
		}

		Image {
			id: removeIcon
			Layout.preferredWidth : 30
			Layout.preferredHeight: 30
			Layout.rightMargin: 18
			fillMode: Image.PreserveAspectFit
			source: "qrc:/image/remove-circle.svg"

			MouseArea {
				anchors.fill: parent
				onClicked: function() {
					removeCurrentItem();
				}
			}
		}
	}

	NotePopup {
		id: textPopup
	}
}



