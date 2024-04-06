import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../NoteScreen/Component"

FudyPopup {
	id: settingPopup
	width: 400
	height: 650
	rightPadding: 12

	headerText: qsTr("Setting")

	contentItem: ScrollView {
		id: popupContentItem

		width: 325
		height: 1000
		contentWidth: columnLayout.width
		contentHeight: columnLayout.height
		clip: true

		ColumnLayout {
			id: columnLayout
			width: parent.width
			spacing: 14

			SyncSettingItem {
				id: syncSettingItem
				Layout.fillWidth: true
				Layout.topMargin: 14
			}

			SplitterItem {
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignHCenter
			}

			//			Rectangle {
			//				id: headerInput
			//				Layout.alignment: Qt.AlignHCenter
			//				Layout.fillWidth: true
			//				Layout.preferredHeight: 1000
			//			}
		}

	}
}
