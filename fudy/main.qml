import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

import "NoteScreen/Component"

import Fudy.style.singleton 1.0

ApplicationWindow {
	id: window

	property alias screenLoader: screenLoader.source
	property alias backgroundColor: windowBackground.color

	minimumWidth: screenLoader.width
	maximumWidth: screenLoader.width
	minimumHeight: screenLoader.height
	maximumHeight: screenLoader.height

	flags: Qt.Window| Qt.FramelessWindowHint

	color: "transparent"
	visible: true
	title: qsTr("Fudy Project")

	background: Rectangle {
		id: windowBackground
		anchors.fill: parent
		radius: 12
		gradient: Gradient {
			GradientStop { position: 0.5; color: FudyColor.background10 }
			GradientStop { position: 1; color: FudyColor.background1 }
		}
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
				screenLoader.source = "qrc:/SignInScreen/SignInScreen.qml";
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
		width: 1166
		height: 800
		sourceComponent: welcomeComp
	}

	Component{
		id: welcomeComp
		Item {
			id: welcomeScreen

			Image {
				id: iconImage
				fillMode: Image.PreserveAspectFit
				anchors.centerIn: parent
				source: "qrc:/image/fudy_main_icon.png"
			}

			MouseArea {
				anchors.fill: parent
				onClicked: function() {
					welcomeScreen.visible = false;
					screenLoader.source = "qrc:/SignInScreen/SignInScreen.qml";
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
