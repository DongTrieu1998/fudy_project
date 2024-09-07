import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Fudy.style.singleton 1.0

ApplicationWindow {
	id: root

	property string headerText: ""
	property alias contentComponent: contentLoader.sourceComponent
	property alias loaderItem: contentLoader.item
	property int index: 0

	signal axisUpdated(int xaxis, int yaxis)
	signal hided(int index)
	signal clicked()
	signal doubleClicked()

	width: 400
	height: 400
	flags: Qt.Window| Qt.FramelessWindowHint
	color: "transparent"
	background: Rectangle {
		id: popupBackground
		radius: internal.radius
		color: FudyColor.layer6
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
				color: FudyColor.layer7

				clip: true
				layer.enabled: true
				layer.smooth: true

				Canvas {
					id: canvas
					anchors.fill: parent
					onPaint: {
						var ctx = getContext("2d");
						ctx.clearRect(0, 0, width, height);

						ctx.beginPath();
						ctx.moveTo(0, internal.radius);
						ctx.arcTo(0, 0, internal.radius, 0, internal.radius);
						ctx.lineTo(width - internal.radius, 0);
						ctx.arcTo(width, 0, width, internal.radius, internal.radius);
						ctx.lineTo(width, height);
						ctx.lineTo(0, height);
						ctx.closePath();

						ctx.fillStyle = FudyColor.layer7;
						ctx.fill();
					}
				}

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
			}
		}

		MouseArea {
			property int prevX: 0
			property int prevY: 0
			anchors.fill: parent

			onPressed: function(mouse) {prevX = mouse.x; prevY = mouse.y}
			onPositionChanged: function(mouse) {
				var deltaX = mouse.x - prevX;
				root.x += deltaX;

				var deltaY = mouse.y - prevY;
				root.y += deltaY;
			}
			onReleased: function() {
				root.axisUpdated(root.x, root.y);
			}
		}
	}

	MouseArea {
		id: mouseArea

		anchors.fill: parent
		hoverEnabled: true
		acceptedButtons: Qt.LeftButton
		pressAndHoldInterval: 100

		onPressAndHold: function(mouse) {
			if (mouse.x >= parent.width - internal.margin
				|| mouse.x <= internal.margin
				|| mouse.y >= parent.height - internal.margin)
			{
				root.startSystemResize(Qt.RightEdge | Qt.BottomEdge);
			}
		}
		onDoubleClicked: function() {
			root.doubleClicked();
		}

		onPositionChanged: function(mouse) {
			if (mouse.x >= parent.width - internal.margin
				&& mouse.y >= parent.height - internal.margin)
			{
				mouseArea.cursorShape = Qt.SizeFDiagCursor;
			} else {
				mouseArea.cursorShape = Qt.ArrowCursor;
			}
		}
	}

	Flickable {
		id: scrollView
		width: parent.width
		height: parent.height - 30
		contentWidth: parent.width
		contentHeight: loaderLayout.implicitHeight + 10
		ScrollBar.vertical: ScrollBar {
			id: scrollBar
			hoverEnabled: true
			active: hovered || pressed
			policy: ScrollBar.AsNeeded
			orientation: Qt.Vertical
			anchors {
				top: parent.top
				bottom: parent.bottom
				left: parent.right
				leftMargin: -20
			}
		}

		ColumnLayout {
			anchors.fill: parent
			anchors.margins: 10

			Loader {
				id: contentLoader
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignTop

				onImplicitHeightChanged: function() {
					scrollBar.increase();
				}
			}
		}
	}

	QtObject {
		id: internal

		property int headerHeight: 35
		property int radius: 8
		property int margin: 15
		property int interval: 100

		property url iconSource: "qrc:/image/exit.svg"
	}
}
