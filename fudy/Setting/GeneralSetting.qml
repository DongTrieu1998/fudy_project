import QtQuick 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

import "../NoteScreen/Component"

SettingItem {
	id: root

	headerText: qsTr("General")

	contentComponent: ColumnLayout {
		spacing: 14

		TextWithToggle {
			contentText: qsTr("Enable insights")
			toggleText: qsTr("Off")

			onToggleClicked: function(checked) {
				toggleText = checked ? qsTr("On") : qsTr("Off")
			}
		}

		TextWithToggle {
			contentText: qsTr("Confirm before delete")
			toggleText: qsTr("Off")

			onToggleClicked: function(checked) {
				toggleText = checked ? qsTr("On") : qsTr("Off")
			}
		}
	}
}
