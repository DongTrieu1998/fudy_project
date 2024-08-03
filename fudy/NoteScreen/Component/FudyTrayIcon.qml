import QtQuick
import Qt.labs.platform

SystemTrayIcon {
	id: root

	signal show();

	visible: true
	icon.source: "qrc:/image/icons_fudy.png"

	tooltip: qsTr("Fudy - Ready")

	onActivated: function(reason) {
		if (reason === SystemTrayIcon.DoubleClick) {
			root.show();
		}
	}

	menu: Menu {
		MenuItem {
			text: qsTr("Show")
			onTriggered: function() {root.show();}
		}
		MenuItem {
			text: qsTr("Quit")
			onTriggered: function() {Qt.quit();}
		}
	}
}
