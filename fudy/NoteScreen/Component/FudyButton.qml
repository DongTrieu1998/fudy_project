import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Basic

import Fudy.style.singleton 1.0

Button {
	id: root

	property bool isBordered: true
	property var textPressColor: FudyColor.layer5
	property var textReleaseColor: FudyColor.layer8
	property var pressColor: FudyColor.layer6
	property var releaseColor: FudyColor.layer7
	property url iconPath: ""

	text: qsTr("Button")
	font: FudyFont.text2

	contentItem: Text {
		id: buttonText
		text: root.text
		font: root.font
		opacity: enabled ? 1.0 : 0.3
		color: root.down ? textPressColor : textReleaseColor
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight

		Image {
			id: icon

			anchors {
				verticalCenter: buttonText.verticalCenter
				left: parent.left
				leftMargin: buttonText.width/2 - textMetrics.width/2 - (icon.width + 16)
			}
			source: iconPath
		}

		TextMetrics {
			id: textMetrics
			text: buttonText.text
			font: buttonText.font
		}
	}

	background: Rectangle {
		implicitWidth: 86
		implicitHeight: 27
		opacity: enabled ? 1 : 0.3
		border.color: !root.isBordered
					  ? "transparent"
					  : (root.down ? pressColor : releaseColor)
		color: root.down ? pressColor : releaseColor
		border.width: 1
		radius: 12
	}
}
