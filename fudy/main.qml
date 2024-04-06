import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import Fudy.style.singleton 1.0

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
		color: FudyColor.background1
	}

	Item {
		id: welcomeScreen
		anchors.fill: parent

		Image {
			id: iconImage
			width: 300
			height: 300
			anchors {
				top: welcomeScreen.top
				topMargin: 92
				horizontalCenter: welcomeScreen.horizontalCenter
			}
			source: "qrc:/image/fudy_main_icon.png"
		}

		Text {
			id: text
			width: 309
			height: 110
			anchors {
				top: welcomeScreen.top
				topMargin: 346
				left: welcomeScreen.left
				leftMargin: 230
			}

			font: FudyFont.heading1
			horizontalAlignment: Text.AlignHCenter
			color: FudyColor.fontColor2

			text: qsTr("Fudy")
		}

		MouseArea {
			anchors.fill: parent
			onClicked: {
				welcomeScreen.visible = false;
				stackView.visible = true;
			}
		}
	}

	FudyMenuBar {
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
}
