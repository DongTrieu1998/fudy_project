import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Fudy.style.singleton 1.0

Rectangle {
	id: root

	property int taskIndex: -1
	property bool enabled: false
	property string header: ""
	property bool noteVisible: false
	property var noteText: ""
	property int xaxis: 0
	property int yaxis: 0

	signal removeCurrentItem()
	signal enabledEditted(bool enabled)
	signal headerEditted(string headerText)
	signal noteTextEditted(string noteText)
	signal noteVisibleUpdated(bool visible)
	signal axisUpdated(int xaxis, int yaxis)
	signal clicked()

	width: noteScreenListView.width
	height: 102
	radius: internal.radius
	color: FudyColor.background7

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
				onClicked: function() {
					root.enabled = !root.enabled
					root.enabledEditted(root.enabled)
				}
			}
		}

		Text {
			id: headerText
			Layout.fillWidth: true
			Layout.preferredHeight: 90
			Layout.leftMargin: 10
			Layout.rightMargin: 30
			font: FudyFont.text1
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			maximumLineCount: 2
			elide: Text.ElideRight
			verticalAlignment: Text.AlignVCenter
			text: root.header

			MouseArea {
				anchors.fill: parent
				hoverEnabled: true

				onClicked: function() {
					root.clicked();
				}

				onDoubleClicked: function() {
					textPopup.open();
				}
			}
		}

		Loader {
			id: contentLoader
			Layout.rightMargin: 30
			sourceComponent: dateTimeText

			MouseArea {
				anchors.fill: parent
				hoverEnabled: true

				onEntered: function() {
					contentLoader.sourceComponent = removeIcon;
				}

				onExited: function() {
					contentLoader.sourceComponent = dateTimeText;
				}
			}
		}

		Component {
			id: removeIcon
			Image {
				Layout.preferredWidth : 30
				Layout.preferredHeight: 30
				fillMode: Image.PreserveAspectFit
				source: "qrc:/image/remove-circle.svg"

				MouseArea {
					anchors.fill: parent
					propagateComposedEvents: true
					onClicked: function() {
						deletePopup.open();
					}
				}
			}
		}

		Component {
			id: dateTimeText
			Text {
				font: FudyFont.text3
				color: FudyColor.fontColor2
				wrapMode: TextInput.Wrap
				maximumLineCount: 2
				elide: Text.ElideRight
				text: internal.getDate()
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
		noteText: root.noteText

		xaxis: root.xaxis
		yaxis: root.yaxis

		onNoteVisibleUpdated: function(visible) {
			root.noteVisible = visible;
			root.noteVisibleUpdated(root.noteVisible);
		}

		onNoteContentUpdated: function(noteContent) {
			root.noteText = noteContent;
			root.noteTextEditted(root.noteText);
		}

		onAxisUpdated: function(xaxis, yaxis) {
			root.xaxis = xaxis;
			root.yaxis = yaxis;
			root.axisUpdated(xaxis, yaxis);
		}
	}

	DeleteItemPopup {
		id: deletePopup

		onDeleteItem: function() {
			root.removeCurrentItem();
		}
	}

	QtObject {
		id: internal

		property int radius: 12

		function getDate() {
			var currentDate = new Date();
			var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
			var month = monthNames[currentDate.getMonth()];
			var day = currentDate.getDate();
			return month + " " + day;
		}
	}
}
