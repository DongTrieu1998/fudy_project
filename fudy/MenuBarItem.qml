import QtQuick
import QtQuick.Layouts

import Fudy.style.singleton 1.0

Image {
	id: root
	property string sourceUrl: ""

	Layout.preferredWidth: 15
	Layout.preferredHeight: 15
	fillMode: Image.PreserveAspectFit
	source: root.sourceUrl
}
