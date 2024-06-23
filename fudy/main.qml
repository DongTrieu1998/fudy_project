import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "NoteScreen/Component"

import Fudy.style.singleton 1.0

ApplicationWindow {
	id: window

	property alias screenLoader: screenLoader.source
	property alias backgroundColor: windowBackground.color

	width: screenLoader.width
	height: screenLoader.height

	minimumWidth: width
	maximumWidth: width
	minimumHeight: height
	maximumHeight: height

	flags: Qt.Window| Qt.FramelessWindowHint

	color: "transparent"
	visible: true
	title: qsTr("Fudy Project")

	background: Rectangle {
		id: windowBackground
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
				window.hide();
			}

			onFudyIconClicked: function() {
				screenLoader.source = "HomeScreen.qml";
			}
		}

		MouseArea{
			property int prevX: 0
			property int prevY: 0
			anchors.fill: parent

			onPressed: function(mouse) {prevX = mouse.x; prevY = mouse.y}
			onPositionChanged: function(mouse) {
				let deltaX = mouse.x - prevX;
				window.x += deltaX;

				let deltaY = mouse.y - prevY;
				window.y += deltaY;
			}
		}
	}

	Loader {
		id: screenLoader
		sourceComponent: welcomeComp
	}

	Component{
		id: welcomeComp
		Item {
			id: welcomeScreen
			width: 800
			height: 643

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
				onClicked: function() {
					welcomeScreen.visible = false;
					screenLoader.source = "HomeScreen.qml";
				}
			}
		}
	}

	FudyTrayIcon {
		id: trayIcon

		onShow: function() {
			window.show();
			window.raise();
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
