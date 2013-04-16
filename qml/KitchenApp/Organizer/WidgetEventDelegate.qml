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

    CommonText {
        id: content
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        wrapMode: Text.WordWrap
        text: month + "/" + day + "  " + title
        height: (lineCount+1) * font.pixelSize
        width: 200
    }
}
