import QtQuick 2.15
import Qt.labs.platform 1.1

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
