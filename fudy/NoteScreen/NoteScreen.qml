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

			MouseArea {
				anchors.fill: parent
				onClicked: {
					noteScreenListView.model.appendNewItem();
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
					taskIndex: index
					enabled: model.enable
					header: model.header
					noteVisible: model.visible
					xaxis: model.xaxis
					yaxis: model.yaxis

					onRemoveCurrentItem: {
						noteScreenListView.model.removeItemAt(index)
					}
					onEnabledEditted: function(enable) {
						console.log(model.id)
						noteScreenListView.model.updateEnabled(index, enable);
					}

					onNoteTextEditted: {

					}

					onHeaderEditted: function(headerText) {
						noteScreenListView.model.updateHeader(index, headerText);
					}

					onNoteVisibleUpdated: function(visible) {
						noteScreenListView.model.updateVisible(index, visible);
					}

					onAxisUpdated: function(xaxis, yaxis){
						noteScreenListView.model.updateAxis(index, xaxis, yaxis);
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
				text: qsTr("Delete All Items")
			}

			MouseArea {
				anchors.fill: parent
				onClicked: {
					noteScreenListView.model.removeCompletedItems();
				}
			}
		}
	}
}
