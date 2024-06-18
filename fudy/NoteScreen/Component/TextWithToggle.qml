import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

Item {
	id: root

	implicitWidth: contentLayout.implicitWidth
	implicitHeight: contentLayout.implicitHeight

	property string toggleText: ""
	property string contentText: ""
	signal toggleClicked(bool checked)

	ColumnLayout {
		id: contentLayout
		spacing: 6

		Text {
			Layout.fillWidth: true
			font: FudyFont.text3
			color: FudyColor.fontColor2
			wrapMode: TextInput.Wrap
			text: root.contentText
		}

		RowLayout {
			spacing: 14

			Toggle {
				id: toggle

				onClicked: function(checked) {
					toggle.checked = !checked;
					root.toggleClicked(toggle.checked);
				}
			}

			Text {
				id: toggleText
				font: FudyFont.text3
				color: FudyColor.fontColor2
				text: root.toggleText
			}
		}
	}

}
