import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0

Rectangle {
	id: root

	property int taskIndex: -1
	property bool enabled: false
	property string header
	property bool noteVisible: false
	property var noteText
	property int xaxis
	property int yaxis

	signal removeCurrentItem()
	signal enabledEditted(bool enable)
	signal headerEditted(string headerText)
	signal noteTextEditted()
	signal noteVisibleUpdated(bool visible)
	signal axisUpdated(int xaxis, int yaxis)
	signal clicked()

	width: noteScreenListView.width
	height: 102
	color: FudyColor.layer3
	border.width: 1
	border.color: FudyColor.layer5

	onClicked: function() {
		if (!root.noteVisible) {
			stickyNote.show();
			root.noteVisible = true;
			root.noteVisibleUpdated(stickyNote.noteVisible)
		}
	}

	RowLayout {
		width: parent.width
		height: parent.height

		Image {
			id: checkbox
			Layout.preferredWidth : 30
			Layout.preferredHeight: 30
			Layout.leftMargin: 18
			fillMode: Image.PreserveAspectFit
			source: root.enabled ? "qrc:/image/checkbox (1).svg" : "qrc:/image/square-small.svg"

			MouseArea {
				anchors.fill: parent
				onClicked: {
					root.enabled = !root.enabled
					root.enabledEditted(root.enabled)
				}
			}
		}

		Text {
			id: headerText
			Layout.fillWidth: true
			font: FudyFont.text1
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			text: root.header

			MouseArea {
				anchors.fill: parent

				onClicked: function() {
					root.clicked();
				}

				onDoubleClicked: {
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
					deletePopup.open();
				}
			}

			Connections {
				target: deletePopup
				function onDeleteItem() {
					removeCurrentItem();
				}
			}
		}
	}

	NotePopup {
		id: textPopup

		popupText: headerText.text

		onPopupContentChanged: function(popupContent) {
			root.header = popupContent;
			root.headerEditted(root.header);
		}
	}

	StickyNote {
		id: stickyNote

		index: root.taskIndex
		noteTitle: headerText.text
		noteVisible: root.noteVisible
		xaxis: root.xaxis
		yaxis: root.yaxis

		onNoteVisibleUpdated: function(visible) {
			root.noteVisible = visible;
			root.noteVisibleUpdated(root.noteVisible);
		}

		onAxisUpdated: function(xaxis, yaxis) {
			root.xaxis = xaxis;
			root.yaxis = yaxis;
			root.axisUpdated(xaxis, yaxis);
		}
	}

	DeleteItemPopup {
		id: deletePopup
	}
}



