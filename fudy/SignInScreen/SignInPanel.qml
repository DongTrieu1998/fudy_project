import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

import "../FudyComponents"
import "../NoteScreen/Component"

import Fudy.style.singleton 1.0

ColumnLayout {
	id: signinLayout

	spacing: 18

	Text {
		id: title

		text: qsTr("Welcome Back")
		font: FudyFont.heading1
	}

	ColumnLayout {

		Layout.fillWidth: true

		Text {
			id: titleContent

			text: qsTr("Today is a new day. It's your day.")
			font: FudyFont.heading2
		}

		Text {
			id: titleContent2

			text: qsTr("Sign in to start managing your projects.")
			font: FudyFont.heading2
		}
	}

	ColumnLayout {

		spacing: 24
		Layout.fillWidth: true

		InputBox {
			id: emailInput

			Layout.alignment: Qt.AlignRight
			title: qsTr("Email")
			placeHolder: qsTr("Example@email.com")
		}

		InputBox {
			id: passwordInput

			Layout.alignment: Qt.AlignRight
			title: qsTr("Password")
			placeHolder: qsTr("At least 8 characters")
		}

		ClickableText {
			id: clickableText

			Layout.alignment: Qt.AlignRight
			text: qsTr("Forgot Password?")
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

	Row {

		Layout.alignment: Qt.AlignCenter

		Text {
			id: signUpText

			text: qsTr("Don't you have an account?")
			font: FudyFont.text1
		}

		Text {
			text: " "
			font: FudyFont.text1
		}

		ClickableText {
			id: clickableSignUpText

			Layout.alignment: Qt.AlignRight
			text: qsTr("Sign up")
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

