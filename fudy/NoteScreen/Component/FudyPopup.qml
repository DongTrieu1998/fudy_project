import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

Popup {
	id: root

	property string headerText: ""
	property alias contentComponent: contentLoader.sourceComponent

	anchors.centerIn: Overlay.overlay
	dim: true
	modal: true
	focus: true
	closePolicy: Popup.NoAutoClose

	background: Rectangle {
		id: popupBackground
		radius: internal.popupRadius
		color: "#F5F5F5"
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
					color: "#FF9AA2"

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

		property string iconSource: "qrc:/image/exit.svg"

	}
}
