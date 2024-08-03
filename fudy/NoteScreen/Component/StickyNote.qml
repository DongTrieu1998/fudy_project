import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Basic

import Fudy.style.singleton 1.0

FramelessWindow {
	id: root

	property int index: 0
	property string noteTitle: ""
	property bool noteVisible: false
	property string noteText: ""
	property int xaxis: 0
	property int yaxis: 0

	signal noteVisibleUpdated(bool visible)
	signal noteContentUpdated(string noteContent)

	headerText: textMetrics.elidedText
	title: textMetrics.text
	x: root.xaxis
	y: root.yaxis
	visible: root.noteVisible
	color: "transparent"

	onHided: function(index) {
		if (index === root.index) {
			root.hide();
			root.noteVisible = false;
			root.noteVisibleUpdated(root.noteVisible);
		}
		if (loaderItem.text.length === 0) {
			loaderItem.text = root.noteText;
		} else {
			root.noteText = loaderItem.text;
			root.noteContentUpdated(loaderItem.text)
		}
	}

	contentComponent: TextField {
		id: textField

		Layout.fillWidth: true
		Layout.fillHeight: true
		Layout.margins: 5

		font: FudyFont.text2
		color: FudyColor.fontColor2
		background: Rectangle {
			color: FudyColor.layer6
		}

		wrapMode: TextInput.Wrap
		placeholderText: qsTr("What do you want???")
		text: root.noteText

		Connections {
			target: root
			function onDoubleClicked() {
				textField.focus = true;
			}
		}
	}

	TextMetrics {
		id: textMetrics

		elide: Text.ElideRight
		elideWidth: 100
		text: root.noteTitle
	}
}
