import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
	id: root
	width: 800
	height: 658
	minimumWidth: width
	maximumWidth: width
	minimumHeight: height
	maximumHeight: height

	visible: true
	title: qsTr("Fudy Project")

	background: Rectangle {
		anchors.fill: parent
		color: "#00017A"
	}

	Item {
		id: welcomeScreen
		anchors.fill: root

		Image {
			id: iconImage
			width: 200
			height: 208
			anchors {
				top: welcomeScreen.top
				topMargin: 92
				left: welcomeScreen.left
				leftMargin: 300
			}

			source: "qrc:/image/icons_fudy.png"
		}

		Text {
			id: text
			width: 280
			height: 110
			anchors {
				top: welcomeScreen.top
				topMargin: 320
				left: welcomeScreen.left
				leftMargin: 243
			}

			font {
				family: "Italianno"
				pixelSize: 128
			}
			horizontalAlignment: Text.AlignHCenter
			color: "#FFDE00" //TODO: Create Font and Color component for Project

			text: qsTr("Fudy")
		}
	}

	MenuBar {
		id: menuBar
		onIconClicked: stackView.pop()
		isShownMenuBar: stackView.depth == 1 ? false : true
	}

	StackView {
		id: stackView
		width: root.width
		anchors.top: menuBar.bottom
		visible: false
		initialItem: HomeScreen {}
		onCurrentItemChanged: {
			currentItem.forceActiveFocus();
		}
		pushExit: Transition {
			XAnimator {
				from: 0
				to: -800
				duration: 200
				easing.type: Easing.OutCubic
			}
		}
	}

	Timer {
		id: timer
		interval: 2000
		running: true
		repeat: false
		onTriggered: {
			welcomeScreen.visible = false;
			stackView.visible = true;
		}
	}

	Component.onCompleted: timer.start()
}
