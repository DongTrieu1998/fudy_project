import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0
import "Component"

Item {
	id: root
	width: 500
	anchors.centerIn: parent

	ColumnLayout {
		anchors.fill: root
		spacing: 1

		Rectangle {
			id: header
			implicitWidth: 500
			implicitHeight: 55
			Layout.fillWidth: true

			border.width: 0.5
			border.color: FudyColor.layer5
			color: FudyColor.layer3

			Text {
				id: headerContent
				anchors.centerIn: parent
				font: FudyFont.keyMedium
				color: FudyColor.fontColor2
				text: qsTr("Add new")
			}

			NotePopup {
				id: notePopup
			}

			MouseArea {
				anchors.fill: parent
				onClicked: {
					noteScreenListView.model.appendItem()
					notePopup.open()
				}
			}
		}

		Frame {
			implicitWidth: 500
			implicitHeight: 488

			background: Rectangle {
				color: "transparent"
				border.color: "#000000"
				border.width: 0.5
			}

			ListView {
				id: noteScreenListView
				width: parent.width - 2
				height: parent.height - 2

				Layout.fillWidth: true
				clip: true

				model: StickNoteModel

				delegate: TaskItem {
					id: delegateItem
					enabled: model.enabled
					header: model.header

					onRemoveCurrentItem: {
						noteScreenListView.model.removeItemAt(index)
					}
					onNoteTextEditted: {
						model.enabled = enabled;
					}
					onHeaderEditted:  {
						model.header = header;
					}
				}
			}
		}

		Rectangle {
			id: footer
			implicitWidth: 500
			implicitHeight: 55
			Layout.fillWidth: true

			border.width: 0.5
			border.color: FudyColor.layer5
			color: FudyColor.layer3

			Text {
				id: footerContent

				anchors.centerIn: parent
				font: FudyFont.keyMedium
				color: FudyColor.fontColor2
				text: qsTr("Stick on your Screen")
			}
		}
	}
}
