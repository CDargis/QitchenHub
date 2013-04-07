import QtQuick 2.0

Rectangle {
    id: notificationDelegate
    width: parent.width
    height: img.height + sirLine.height + 10
    anchors.left: parent.left
    color: "transparent"
    property string notificationText: ""
    property string functor: "function doIt() { console.log('nope') }"
    MouseArea {
        anchors.fill: parent
        onClicked: {
            //img.visible = false
            nText.font.bold = false
            eval(functor)
            doIt()
        }
    }
    Rectangle {
        id: sirLine
        width: parent.width
        height: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: "black"
    }
    Image {
        id: img
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 2
        width: parent.width * (1/25); height: parent.width * (1/25)
        source: "qrc:/images/ex1.png"
    }

    Text {
        id: nText
        anchors.verticalCenter: img.verticalCenter
        anchors.left: img.right
        anchors.leftMargin: 10
        wrapMode: Text.Wrap
        font.family: fontFamily
        font.pointSize: 10
        font.bold: true
        text: notificationText
    }
}
