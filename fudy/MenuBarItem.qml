import QtQuick 2.15
import QtQuick.Layouts 1.15

import Fudy.style.singleton 1.0

Image {
	id: root
	property string sourceUrl: ""

	Layout.preferredWidth: 15
	Layout.preferredHeight: 15
	fillMode: Image.PreserveAspectFit
	source: root.sourceUrl
}
