import QtQuick
import Qt.labs.platform

SystemTrayIcon {
	id: root

	signal show();

	visible: true
	icon.source: "qrc:/image/icons_fudy.png"

	tooltip: qsTr("Fudy - Ready") + Translator.language

	onActivated: function(reason) {
		if (reason === SystemTrayIcon.DoubleClick) {
			root.show();
		}
	}

	menu: Menu {
		MenuItem {
			text: qsTr("Show") + Translator.language
			onTriggered: function() {root.show();}
		}
		MenuItem {
			text: qsTr("Quit") + Translator.language
			onTriggered: function() {Qt.quit();}
		}
	}
}
