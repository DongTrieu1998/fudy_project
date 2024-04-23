import QtQuick 2.0

Rectangle {
	id: root

	property bool checked

	signal clicked(bool checked);

	width: 44
	height: 20
	border.width: 2
	radius: height/2
	color: checked? "#FF9AA2": "#F5F5F5" // background

	Rectangle {
		id: pill

		x: checked? root.width - (pill.radius + root.radius) : root.radius - pill.radius
		width: 10
		height: width
		color: "black"
		radius: width/2

		anchors.verticalCenter: parent.verticalCenter
	}

	MouseArea {
		id: mouseArea

		anchors.fill: parent

		onClicked: {
			root.clicked(checked)
		}
	}
}
