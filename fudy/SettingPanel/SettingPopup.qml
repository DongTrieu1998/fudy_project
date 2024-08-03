import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../NoteScreen/Component"

FudyPopup {
	id: root
	implicitWidth: 400

	headerText: qsTr("Settings")

	contentComponent: ColumnLayout {
		ScrollView {
			id: popupContentItem

			Layout.preferredWidth: 400
			Layout.preferredHeight: 560

			contentWidth: parent.implicitWidth
			contentHeight: columnLayout.implicitHeight

			clip: true

			ColumnLayout {
				id: columnLayout
				anchors.fill: parent
				spacing: 14

				SyncSettingItem {
					id: syncSettingItem
					Layout.leftMargin: 16
					Layout.fillWidth: true
				}

				SplitterItem {
					Layout.leftMargin: 16
					Layout.rightMargin: 16
					Layout.fillWidth: true
					Layout.alignment: Qt.AlignHCenter
				}

				GeneralSetting {
					id: generalSetting
					Layout.leftMargin: 16
					Layout.fillWidth: true
				}

				SplitterItem {
					Layout.leftMargin: 16
					Layout.rightMargin: 16
					Layout.fillWidth: true
					Layout.alignment: Qt.AlignHCenter
				}

				ThemeSetting {
					id: themeSetting
					Layout.leftMargin: 16
					Layout.fillWidth: true
				}

				SplitterItem {
					Layout.leftMargin: 16
					Layout.rightMargin: 16
					Layout.fillWidth: true
					Layout.alignment: Qt.AlignHCenter
				}

				LanguageSetting {
					id: languageSetting
					Layout.leftMargin: 16
					Layout.fillWidth: true
				}

				SplitterItem {
					Layout.leftMargin: 16
					Layout.rightMargin: 16
					Layout.fillWidth: true
					Layout.alignment: Qt.AlignHCenter
				}
			}
		}
	}
}
