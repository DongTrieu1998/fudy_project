import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "NoteScreen/Component"

import Fudy.style.singleton 1.0

ApplicationWindow {
	id: root
	width: 800
	height: 643
	minimumWidth: width
	maximumWidth: width
	minimumHeight: height
	maximumHeight: height

	flags: Qt.Window| Qt.FramelessWindowHint

	color: "transparent"
	visible: true
	title: qsTr("Fudy Project")

	background: Rectangle {
		anchors.fill: parent
		radius: 12
		color: FudyColor.background1
	}

	menuBar: Loader {
		id: menuBar
		Layout.fillWidth: true
		Layout.alignment: Qt.AlignTop

		sourceComponent: FudyMenuBar {
			onExitIconClicked: function() {
				root.hide();
			}

			onFudyIconClicked: function() {
				stackView.pop();
			}
		}
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

	FudyTrayIcon {
		id: trayIcon

		onShow: function() {
			root.show();
			root.raise();
		}
	}

	QtObject {
		id: internal

		property int headerHeight: 35
		property int radius: 8

		property string iconSource: "qrc:/image/exit.svg"
		property string fudyIconSource: "qrc:/image/icons_fudy.png"
	}
}
