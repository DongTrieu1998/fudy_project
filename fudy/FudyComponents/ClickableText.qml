import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import Fudy.style.singleton 1.0

Item {
	id: root

	property string text: ""

	implicitWidth: clickableText.width
	implicitHeight: clickableText.height

	Text {
		id: clickableText

		font: FudyFont.text1
		color: "#1E4AE9"
		text: root.text

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true

			onContainsMouseChanged: function() {

			}

			onClicked: function() {

			}
		}
	}
}
