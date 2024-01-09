import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
	id: root
	property string sourceUrl: ""
	Layout.preferredWidth: 30
	Layout.preferredHeight: 30
	Image {
		fillMode: Image.PreserveAspectFit
		source: root.sourceUrl
	}
}
