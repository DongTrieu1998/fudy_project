import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

Popup {
	id: root

	property string headerText: ""
	property alias contentComponent: contentLoader.sourceComponent

	dim: true
	modal: true
	focus: true
	anchors.centerIn: Overlay.overlay
	closePolicy: Popup.NoAutoClose

	background: Rectangle {
		id: popupBackground
		radius: internal.popupRadius
		color: FudyColor.background9
	}

	contentItem: ColumnLayout {
		anchors.fill: parent
		spacing: 0

		Loader {
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignTop

			sourceComponent: ColumnLayout {
				id: headerLoader

				Rectangle {
					id: headerRect
					Layout.fillWidth: true
					Layout.preferredHeight: internal.headerHeight
					radius: internal.popupRadius
					color: FudyColor.layer7

					Text {
						id: headerText

						anchors {
							left: headerRect.left
							leftMargin: 20
							verticalCenter: headerRect.verticalCenter
						}
						font: FudyFont.headingPopup
						text: root.headerText
					}

					Image {
						id: exitIcon
						anchors {
							right: headerRect.right
							rightMargin: 20
							verticalCenter: headerRect.verticalCenter
						}
						fillMode: Image.PreserveAspectFit
						source: internal.iconSource

						MouseArea {
							anchors.fill: parent

							onClicked: function() {
								close();
							}
						}
					}

					Rectangle {
						width: parent.width
						height: internal.popupRadius
						anchors.bottom: headerRect.bottom
						color: headerRect.color
					}
				}
			}
		}

		Loader {
			id: contentLoader

			Layout.fillWidth: true
		}
	}

	QtObject {
		id: internal

		property int headerHeight: 50
		property int popupRadius: 12

		property url iconSource: "qrc:/image/exit.svg"
	}
}
