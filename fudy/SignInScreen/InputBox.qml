import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic

import Fudy.style.singleton 1.0

Item {
	id: root

	width: 378
	height: 72

	property string title: ""
	property string placeHolder: ""

	ColumnLayout {
		anchors.fill: parent
		spacing: 8

		Text {
			id: title
			text: root.title
			font: FudyFont.heading2
		}

		Rectangle {
			width: root.width
			height: 48
			radius: 12
			color: FudyColor.layer12

			TextField {
				id: inputField
				Layout.fillWidth: true
				background: Item {}

				anchors.verticalCenter: parent.verticalCenter
				placeholderText: root.placeHolder
				font: FudyFont.text1
			}
		}
	}
}
