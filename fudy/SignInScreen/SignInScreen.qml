import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import "../FudyComponents"
import "../NoteScreen/Component"

import Fudy.style.singleton 1.0

Item {
	id: signInWidget

	Loader {
		id: panelLoader

		anchors {
			right: imagePanel.left
			top: imagePanel.top
			topMargin: 70
		}

		sourceComponent: signInPanel
	}

	Image {
		id: imagePanel

		anchors {
			top: signInWidget.top
			topMargin: 32
			right: signInWidget.right
			rightMargin: 35
		}

		fillMode: Image.PreserveAspectFit
		source: "qrc:/image/stick_note_3d.png"
	}

	Component {
		id: signInPanel

		SignInPanel {}
	}

	Component.onCompleted: function() {
		window.backgroundColor = FudyColor.background1;

		var screenWidth = Screen.desktopAvailableWidth;
		var screenHeight = Screen.desktopAvailableHeight;

		// Calculate the position to center the window
		var x = (screenWidth - signInWidget.width) / 2;
		var y = (screenHeight - signInWidget.height) / 2;

		// Set the window position
		window.x = x;
		window.y = y;
	}
}
