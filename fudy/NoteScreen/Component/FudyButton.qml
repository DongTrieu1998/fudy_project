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
		color: root.down ? "#000000" : "#E51818"
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight
	}

	background: Rectangle {
		implicitWidth: 86
		implicitHeight: 27
		opacity: enabled ? 1 : 0.3
		border.color: root.down ? "#F5F5F5" : "#FF9AA2"
		color: root.down ? "#FF9AA2" : "#F5F5F5"
		border.width: 1
		radius: 12
	}
}
