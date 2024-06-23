import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

Item {
	id: root

	implicitWidth: contentLayout.implicitWidth
	implicitHeight: contentLayout.implicitHeight

	property string headerText: ""
	property alias contentComponent: contentLoader.sourceComponent

	ColumnLayout {
		id: contentLayout
		spacing: 10

		Text {
			id: headerText

			font: FudyFont.heading2
			text: root.headerText
		}

		Loader {
			id: contentLoader

			Layout.fillWidth: true
		}
	}
}
