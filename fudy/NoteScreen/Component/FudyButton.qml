import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts
import QtQuick.Controls.Basic

import Fudy.style.singleton 1.0

Button {
	id: root

	property color textColor: FudyColor.layer8
	property color textPressColor: FudyColor.layer5
	property color backgroundColor: FudyColor.layer6
	property color backgroundPressColor: FudyColor.layer7
	property url iconSource: ""

	text: qsTr("Button")
	font: FudyFont.text1

	contentItem: ColumnLayout {
		RowLayout {
			Layout.alignment: Qt.AlignCenter
			spacing: 16

			Image {
				id: icon
				visible: !!root.iconSource.toString().length
				fillMode: Image.PreserveAspectFit
				Layout.alignment: Qt.AlignVCenter
				source: iconSource
			}

			Text {
				Layout.alignment: Qt.AlignVCenter
				text: root.text
				font: root.font
				opacity: enabled ? 1.0 : 0.3
				color: root.down ? textPressColor : textColor
				verticalAlignment: Text.AlignVCenter
				elide: Text.ElideRight
			}
		}
	}

	background: Rectangle {
		implicitWidth: 86
		implicitHeight: 27
		opacity: enabled ? 1 : 0.3
		color: root.down ? backgroundPressColor : backgroundColor
		radius: 12
	}
}
