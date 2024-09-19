import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic

import Fudy.style.singleton 1.0

Item {
	id: root

	signal clicked()

	property string text: ""

	implicitWidth: clickableText.width
	implicitHeight: clickableText.height

	Text {
		id: clickableText

		font: FudyFont.text1
		color: FudyColor.fontColor5
		text: root.text

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true

			onEntered: function() {
				cursorShape = Qt.PointingHandCursor
			}

			onExited: function() {
				cursorShape = Qt.ArrowCursor
			}

			onClicked: function() {
				root.clicked();
			}
		}
	}
}
