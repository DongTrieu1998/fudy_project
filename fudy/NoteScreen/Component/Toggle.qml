import QtQuick 2.0

import Fudy.style.singleton 1.0

Rectangle {
	id: root

	property bool checked

	signal clicked(bool checked);

	width: 44
	height: 20
	border.width: 2
	radius: height / 2
	color: checked? FudyColor.background8: FudyColor.background9 // background

	Rectangle {
		id: pill

		x: internal.xAxisOfPill(root.checked)
		width: 10
		height: width
		color: FudyColor.layer5
		radius: width / 2

		anchors.verticalCenter: parent.verticalCenter
	}

	MouseArea {
		id: mouseArea

		anchors.fill: parent

		onClicked: function() {
			root.clicked(root.checked);
		}

		onPressed: function() {
			root.border.color = FudyColor.layer7;
		}

		onReleased: function() {
			root.border.color = FudyColor.layer5;
		}
	}

	QtObject {
		id: internal

		function xAxisOfPill(isChecked) {
			return isChecked ? root.width - (pill.radius + root.radius) : root.radius - pill.radius;
		}
	}
}
