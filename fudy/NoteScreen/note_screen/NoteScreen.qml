import QtQuick 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0
import note_screen 1.0

Component {
	id: root

	Item {
		Rectangle {
			id: header
			width: noteScreenListView.width
			height: 55
			border.width: 2
			border.color: FudyColor.layer5
			color: FudyColor.layer2

			Text {
				id: headerContent
				anchors.centerIn: parent
				font: FudyFont.keyMedium
				color: FudyColor.fontColor1
				text: qsTr("ALL YOUR NOTE")
			}
		}

		ListView {
			id: noteScreenListView
			width: 318
			height: 490
			anchors.top: header.bottom
			clip: true

			model: StickNoteModel

			delegate: Rectangle {
				id: delegate

				width: noteScreenListView.width
				height: 102
				color: FudyColor.layer2
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
						source: model.enable ? "qrc:/image/checkbox (1).svg" : "qrc:/image/square-small.svg"

						MouseArea {
							anchors.fill: parent
							onClicked: {
								StickNoteModel.appendItem()
							}
						}
					}

					TextEdit {
						Layout.fillWidth: true
						font: FudyFont.text1
						text: model.noteText
					}
				}
			}
		}

		Rectangle {
			id: footer
			width: noteScreenListView.width
			height: 55
			border.width: 2
			border.color: FudyColor.layer5
			anchors.top: noteScreenListView.bottom
			color: FudyColor.layer3

			Text {
				id: footerContent
				anchors.centerIn: parent
				font: FudyFont.keyMedium
				color: FudyColor.fontColor2
				text: qsTr("Stick on your Screen")
			}
		}

		Rectangle {
			id: stickBase
			width: 482
			height: 600
			anchors.left: noteScreenListView.right
			color: FudyColor.background2

			Image {
				id: stickeyNote
				width: 400
				height: 400
				anchors.centerIn: stickBase
				fillMode: Image.PreserveAspectFit
				source: "qrc:/image/postit.svg"
			}

			TextEdit {
				id: contentOfNote
				width: stickeyNote.width - 100
				height: stickeyNote.height - 100
				anchors.centerIn: stickeyNote
				font: FudyFont.text1
				color: FudyColor.fontColor2
				focus: true
				wrapMode: TextEdit.Wrap
				text: "Note that the TextEdit does not implement scrolling, following the cursor, or other behaviors specific to a look-and-feel. For example, to add flickable scrolling that follows the cursor:"
			}

		}
	}
}