import QtQuick 2.0

Rectangle {
    color: "transparent"
    border.color: "black"
    border.width: 1
    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 55
        width: parent.width; height: 50
        color: "transparent"
        Text {
            anchors.centerIn: parent
            font.family: fontFamily
            font.pointSize: 30
            text: "Home Security"
        }
    }
}
