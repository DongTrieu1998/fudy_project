import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Window

import Fudy.style.singleton 1.0
import "Component"

Item {
	id: root
	width: Math.max(header.implicitWidth, frameListview.implicitWidth, footer.implicitWidth)
	height: header.implicitHeight + frameListview.implicitHeight + footer.implicitHeight + 35

	ColumnLayout {
		spacing: 1

		Rectangle {
			id: header
			implicitWidth: 500
			implicitHeight: 55
			Layout.fillWidth: true

			color: FudyColor.layer3

			Text {
				id: headerContent
				anchors.centerIn: parent
				font: FudyFont.keyMedium
				color: FudyColor.fontColor2
				text: qsTr("Add new") + Translator.language
			}

			MouseArea {
				anchors.fill: parent
				onClicked: function() {
					noteScreenListView.model.appendNewItem();
				}
			}
		}

		Frame {
			id: frameListview
			implicitWidth: 500
			implicitHeight: 700

			background: Rectangle {
				color: "transparent"
			}

			ListView {
				id: noteScreenListView
				width: parent.width - 2
				height: parent.height - 2

				cacheBuffer: 2000

				Layout.fillWidth: true
				clip: true
				spacing: 10

				model: StickNoteModel

				ScrollBar.vertical: ScrollBar {
					id: scrollBar
					hoverEnabled: true
					active: hovered || pressed
					orientation: Qt.Vertical
					anchors {
						top: parent.top
						right: parent.right
						rightMargin: -5
						bottom: parent.bottom
					}
				}

				delegate: TaskItem {
					id: delegateItem
					taskIndex: index
					enabled: model.enabled
					header: model.header
					noteText: model.noteText
					noteVisible: model.visible
					xaxis: model.xaxis
					yaxis: model.yaxis

					onRemoveCurrentItem: function() {
						noteScreenListView.model.removeItemAt(index)
					}
					onEnabledEditted: function(enabled) {
						noteScreenListView.model.updateEnabled(index, enabled);
					}

					onHeaderEditted: function(headerText) {
						noteScreenListView.model.updateHeader(index, headerText);
					}

					onNoteVisibleUpdated: function(visible) {
						noteScreenListView.model.updateVisible(index, visible);
					}

					onNoteTextEditted: function(noteText) {
						noteScreenListView.model.updateNoteText(index, noteText);
					}

					onAxisUpdated: function(xaxis, yaxis) {
						noteScreenListView.model.updateAxis(index, xaxis, yaxis);
					}
				}
			}
		}

		Rectangle {
			id: footer
			implicitWidth: 500
			implicitHeight: 55
			radius: 16
			Layout.fillWidth: true

			Rectangle {
				anchors {
					left: footer.left
					right: footer.right
					top: footer.top
				}
				height: footer.radius
				color: FudyColor.layer3
			}

			color: FudyColor.layer3

			Text {
				id: footerContent

				anchors.centerIn: parent
				font: FudyFont.keyMedium
				color: FudyColor.fontColor2
				text: qsTr("Delete All Items") + Translator.language
			}

			MouseArea {
				anchors.fill: parent
				onClicked: function() {
					noteScreenListView.model.removeCompletedItems();
				}
			}
		}
	}

	Component.onCompleted: function() {
		window.backgroundColor = "white";

		var screenWidth = Screen.desktopAvailableWidth;
		var screenHeight = Screen.desktopAvailableHeight;

		// Calculate the position to center the window
		var x = (screenWidth - root.width) / 2;
		var y = (screenHeight - root.height) / 2;

		// Set the window position
		window.x = x;
		window.y = y;
	}
}
