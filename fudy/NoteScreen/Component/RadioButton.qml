import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Templates 2.15 as T

import Fudy.style.singleton 1.0

T.RadioButton {
	id: control

	implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
							implicitContentWidth + leftPadding + rightPadding)
	implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
							 implicitContentHeight + topPadding + bottomPadding,
							 implicitIndicatorHeight + topPadding + bottomPadding)

	spacing: 13
	text: qsTr("RadioButton")
	indicator: Rectangle {
		implicitWidth: 20
		implicitHeight: 20
		x: control.leftPadding
		y: parent.height / 2 - height / 2
		radius: 10
		border.color: control.down ? "#000000" : "#FF9AA2"

		Rectangle {
			width: 10
			height: 10
			x: 5
			y: 5
			radius: 5
			color: control.down ? "#FF9AA2" : "#000000"
			visible: control.checked
		}
	}

	contentItem: Text {
		text: control.text
		font: FudyFont.text3
		opacity: enabled ? 1.0 : 0.3
		color: control.checked ? "#000000" : "#FF9AA2"
		verticalAlignment: Text.AlignVCenter
		leftPadding: control.indicator.width + control.spacing
	}
}
