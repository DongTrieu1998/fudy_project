import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

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
			color: FudyColor.layer3

			Text {
				id: headerContent
				anchors.centerIn: parent
				font: FudyFont.keyMedium
				color: FudyColor.fontColor2
				text: qsTr("Add new")
			}

			MouseArea {
				anchors.fill: parent
				onClicked: noteScreenListView.model.appendItem()
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
				property variant itemData: model

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
								model.enable = !model.enable
							}
						}
					}

					TextField {
						Layout.fillWidth: true
						font: FudyFont.text1
						color: FudyColor.fontColor2
						wrapMode: TextInput.Wrap
						text: model.header

						onPressed: {
							noteScreenListView.currentIndex = index
						}

						onEditingFinished: {
							model.header = text
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
							onClicked: {
								noteScreenListView.model.removedItemAt(index)
							}
						}
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
				text: noteScreenListView.currentItem.itemData.noteText
			}

			Button {
				id: saveButton
				anchors {
					top: contentOfNote.bottom
					topMargin: 20
					horizontalCenter: contentOfNote.horizontalCenter
				}
				background: Rectangle {
					implicitWidth: 200
					implicitHeight: 55
					opacity: enabled ? 1 : 0.3
					border.color: FudyColor.layer5
					color: FudyColor.layer3
				}

				Text {
					anchors.centerIn: parent
					font: FudyFont.keyMedium
					color: FudyColor.fontColor2
					text: qsTr("Save")
				}

				onClicked: noteScreenListView.currentItem.itemData.noteText = contentOfNote.text
			}
		}
	}
}
