import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Fudy.style.singleton 1.0

Popup {
	id: root

	property string headerText: ""
	property alias contentComponent: contentLoader.sourceComponent

	padding: 0
	bottomPadding: 10
	rightPadding: -1
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
		spacing: 0

		Loader {
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignTop

			sourceComponent: ColumnLayout {
				id: headerLoader
				spacing: - 12

				Rectangle {
					id: headerRect
					Layout.fillWidth: true
					Layout.preferredHeight: internal.headerHeight
					radius: internal.popupRadius
					color: FudyColor.layer7

					clip: true
					layer.enabled: true
					layer.smooth: true

					Canvas {
						id: canvas
						anchors.fill: parent
						onPaint: {
							var ctx = getContext("2d");
							ctx.clearRect(0, 0, width, height);

							ctx.beginPath();
							ctx.moveTo(0, internal.popupRadius);
							ctx.arcTo(0, 0, internal.popupRadius, 0, internal.popupRadius);
							ctx.lineTo(width - internal.popupRadius, 0);
							ctx.arcTo(width, 0, width, internal.popupRadius, internal.popupRadius);
							ctx.lineTo(width, height);
							ctx.lineTo(0, height);
							ctx.closePath();

							ctx.fillStyle = FudyColor.layer7;
							ctx.fill();
						}
					}

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

		property int headerHeight: 40
		property int popupRadius: 12

		property url iconSource: "qrc:/image/exit.svg"
	}
}
