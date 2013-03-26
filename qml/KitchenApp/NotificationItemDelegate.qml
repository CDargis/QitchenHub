import QtQuick 2.0

Rectangle {
    id: notificationDelegate
    width: notificationRect.width
    height: notificationRect.height / 6
    anchors.left: parent.left
    anchors.leftMargin: 10
    color: "transparent"
    property string notificationText: ""
    property bool bold: true
    MouseArea {
        anchors.fill: parent
        onClicked: {
            bold = false
        }
    }
    Text {
        wrapMode: Text.Wrap
        anchors.left: parent.left
        font.family: fontFamily
        font.pointSize: 10
        font.bold: bold
        text: notificationText
    }
}
