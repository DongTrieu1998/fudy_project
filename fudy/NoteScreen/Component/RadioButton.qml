import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

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
		border.color: control.down ? FudyColor.layer5 : FudyColor.layer7

		Rectangle {
			width: 10
			height: 10
			x: 5
			y: 5
			radius: 5
			color: control.down ? FudyColor.layer7 : FudyColor.layer5
			visible: control.checked
		}
	}

	contentItem: Text {
		text: control.text
		font: FudyFont.text3
		opacity: enabled ? 1.0 : 0.3
		color: control.checked ? FudyColor.layer5 : FudyColor.layer7
		verticalAlignment: Text.AlignVCenter
		leftPadding: control.indicator.width + control.spacing
	}
}
