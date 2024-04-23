import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0

FramelessWindow {
	id: root
	width: 300
	height: 300

	property int index
	property string noteTitle
	property bool noteVisible
	property int xaxis
	property int yaxis

	signal noteVisibleUpdated(bool visible)

	headerText: textMetrics.elidedText
	title: textMetrics.text
	x: root.xaxis
	y: root.yaxis
	visible: root.noteVisible
	color: "transparent"

	onHided: function(index) {
		if (index === root.index) {
			console.log(index)
			root.hide();
			root.noteVisible = false;
			root.noteVisibleUpdated(root.noteVisible)
		}
	}

	contentComponent: ColumnLayout {
		spacing: 12

		TextArea {
			id: textField
			Layout.fillWidth: true
			Layout.fillHeight: true
			Layout.margins: 5
			font: FudyFont.text2
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			placeholderText: qsTr("Enter your Note's header")

			onEditingFinished: function() {
				if (textField.text.length == 0) {
					textField.text = root.noteTitle;
				}
			}

			Connections {
				target: root
				function onDoubleClicked() {
					textField.focus = true;
				}
			}
		}
	}

	TextMetrics {
		id: textMetrics

		elide: Text.ElideRight
		elideWidth: 200
		text: root.noteTitle
	}
}
