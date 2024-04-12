import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../NoteScreen/Component"

FudyPopup {
	id: root
	implicitWidth: 400

	headerText: qsTr("Setting")

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
