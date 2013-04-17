import QtQuick 2.0
import ".."

Item {
    id: root
    width: parent.width
    height: content.height + 6
    property string month: "00"
    property string day: "00"
    property string title: qsTr("Empty") + tr.emptyString
    property color bgColor: "#111111"

    Rectangle {
        opacity: 0.5
        color: bgColor
        anchors.fill: parent
    }

    Text {
        id: content
        color: "#36c60f"
        lineHeightMode: Text.FixedHeight
        lineHeight: font.pixelSize
        anchors.left: parent.left
        anchors.leftMargin: 3
        anchors.right: parent.right
        anchors.rightMargin: 3
        font.pixelSize: 18
        wrapMode: Text.Wrap
        text: month + "/" + day + "  " + title
        height: (lineCount) * (lineHeight)
    }
}
