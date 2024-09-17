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

		text: qsTr("Forgot password?")
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
			title: qsTr("Name")
			placeHolder: qsTr("Enter your name")
		}

		InputBox {
			id: passwordInput

			Layout.alignment: Qt.AlignRight
			title: qsTr("Email")
			placeHolder: qsTr("Please enter your email")
		}

		InputBox {
			id: retypePasswordInput

			Layout.alignment: Qt.AlignRight
			title: qsTr("Hint")
			placeHolder: qsTr("Enter your hint")
		}

		FudyButton {
			Layout.fillWidth: true
			Layout.preferredHeight: 52

			textColor: FudyColor.fontColor1
			textPressColor: FudyColor.fontColor1
			backgroundColor: FudyColor.layer13
			backgroundPressColor: FudyColor.layer13

			text: qsTr("Reset password")
		}
	}
}

