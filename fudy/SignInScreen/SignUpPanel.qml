import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../FudyComponents"
import "../NoteScreen/Component"

import Fudy.style.singleton 1.0

ColumnLayout {
	id: signinLayout

	spacing: 18

	Text {
		id: title

		text: qsTr("Create an account")
		font: FudyFont.heading1
	}

	Text {
		id: titleContent

		text: qsTr("Please enter your details")
		font: FudyFont.heading2
	}

	ColumnLayout {

		spacing: 24
		Layout.fillWidth: true

		InputBox {
			id: emailInput

			Layout.alignment: Qt.AlignRight
			title: qsTr("Email")
			placeHolder: qsTr("Please enter your email")
		}

		InputBox {
			id: passwordInput

			Layout.alignment: Qt.AlignRight
			title: qsTr("Password")
			placeHolder: qsTr("Enter your password")
		}

		InputBox {
			id: retypePasswordInput

			Layout.alignment: Qt.AlignRight
			title: qsTr("Retype Password")
			placeHolder: qsTr("Retype your password")
		}

		Row {

			Layout.alignment: Qt.AlignCenter

			Text {
				id: signUpText

				text: qsTr("Already have an account?")
				font: FudyFont.text1
			}

			Text {
				text: " "
				font: FudyFont.text1
			}

			ClickableText {
				id: clickableSignUpText

				Layout.alignment: Qt.AlignRight
				text: qsTr("Sign In")

				onClicked: function() {
					panelLoader.source = "qrc:/SignInScreen/SignInPanel.qml"
				}
			}
		}

		FudyButton {

			Layout.fillWidth: true
			Layout.preferredHeight: 52

			textColor: FudyColor.fontColor1
			textPressColor: FudyColor.fontColor1
			backgroundColor: FudyColor.layer13
			backgroundPressColor: FudyColor.layer13

			text: qsTr("Sign in")
		}
	}

	RowLayout {
		Layout.alignment: Qt.AlignCenter
		spacing: 16

		SplitterItem {
			width: 164
			Layout.alignment: Qt.AlignVCenter
			color: FudyColor.layer14
		}

		Text {
			Layout.alignment: Qt.AlignVCenter
			text: qsTr("Or")
			font: FudyFont.text1
		}

		SplitterItem {
			width: 164
			Layout.alignment: Qt.AlignVCenter
			color: FudyColor.layer14
		}
	}

	FudyButton {
		Layout.fillWidth: true
		Layout.preferredHeight: 52

		textColor: FudyColor.fontColor6
		textPressColor: FudyColor.fontColor6
		backgroundColor: FudyColor.layer15
		backgroundPressColor: FudyColor.layer15
		iconSource: "qrc:/image/Google.svg"

		text: qsTr("Sign in with Google")
	}
}

