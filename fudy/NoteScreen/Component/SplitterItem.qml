import QtQuick 2.12

import Fudy.style.singleton 1.0

Rectangle {
	id: root

	property color modifiedColor: FudyColor.layer5

	implicitHeight: 1
	color: root.modifiedColor
}
