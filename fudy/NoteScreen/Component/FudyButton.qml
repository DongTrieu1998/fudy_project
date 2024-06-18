import QtQuick 2.12
import QtQuick.Controls 2.12

import Fudy.style.singleton 1.0

Button {
	id: root
	text: qsTr("Button")
	font: FudyFont.text2

	contentItem: Text {
		text: root.text
		font: root.font
		opacity: enabled ? 1.0 : 0.3
		color: root.down ? FudyColor.layer5 : FudyColor.layer8
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight
	}

	background: Rectangle {
		implicitWidth: 86
		implicitHeight: 27
		opacity: enabled ? 1 : 0.3
		border.color: root.down ? FudyColor.layer6 : FudyColor.layer7
		color: root.down ? FudyColor.layer7 : FudyColor.layer6
		border.width: 1
		radius: 12
	}
}
