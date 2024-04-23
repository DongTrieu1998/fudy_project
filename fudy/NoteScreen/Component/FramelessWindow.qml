import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

ApplicationWindow {
	id: root

	property string headerText: ""
	property alias contentComponent: contentLoader.sourceComponent
	property int index

	signal axisUpdated(int xaxis, int yaxis)
	signal hided(int index)
	signal clicked()
	signal doubleClicked()

	flags: Qt.Window| Qt.FramelessWindowHint
	color: "transparent"
	background: Rectangle {
		id: popupBackground
		radius: internal.radius
		color: "#F5F5F5"
	}

	menuBar: Loader {
		Layout.fillWidth: true
		Layout.alignment: Qt.AlignTop

		sourceComponent: ColumnLayout {
			id: headerLoader

			Rectangle {
				id: headerRect
				Layout.fillWidth: true
				Layout.preferredHeight: internal.headerHeight
				radius: internal.radius
				color: "#FF9AA2"

				Text {
					id: headerText

					anchors {
						left: headerRect.left
						leftMargin: 20
						verticalCenter: headerRect.verticalCenter
					}
					font: FudyFont.headingPopup
					text: root.headerText
				}

				Image {
					id: exitIcon
					anchors {
						right: headerRect.right
						rightMargin: 15
						verticalCenter: headerRect.verticalCenter
					}
					fillMode: Image.PreserveAspectFit
					source: internal.iconSource

					MouseArea {
						anchors.fill: parent
						onClicked: function() {
							root.hided(root.index);
						}
					}
				}

				Rectangle {
					width: parent.width
					height: internal.radius
					anchors.bottom: headerRect.bottom
					color: headerRect.color
				}
			}
		}

		MouseArea{
			property int prevX: 0
			property int prevY: 0
			anchors.fill: parent

			onPressed: {prevX = mouse.x; prevY = mouse.y}
			onPositionChanged:{
				var deltaX = mouse.x - prevX;
				root.x += deltaX;

				var deltaY = mouse.y - prevY
				root.y += deltaY;
			}
			onReleased: function() {
				root.axisUpdated(root.x, root.y)
			}
		}
	}

	MouseArea {
		id: mouseArea

		anchors.fill: parent

		acceptedButtons: Qt.LeftButton
		pressAndHoldInterval: internal.interval
		onPressAndHold: function(mouse) {
			if (mouse.x >= parent.width - internal.margin || mouse.x <= internal.margin || mouse.y >= parent.height - internal.margin) {
				root.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
			}
		}
		onDoubleClicked: function() {
			root.doubleClicked();
		}
	}

	ColumnLayout {
		anchors.fill: parent
		spacing: 0

		Loader {
			id: contentLoader
			Layout.fillWidth: true
		}
	}

	QtObject {
		id: internal

		property int headerHeight: 35
		property int radius: 8
		property int margin: 15
		property int interval: 100

		property string iconSource: "qrc:/image/exit.svg"
	}
}
