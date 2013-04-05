import QtQuick 2.0

Rectangle {
    width: 400
    height: 50
    color: "transparent"
    border.color: "black"
    border.width: 1

    property string sensorTitle: ""

    Image {
        id: light
        width: parent.height * .75; height: parent.height * .75
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: light.right
        anchors.leftMargin: 10
        font.family: fontFamily
        font.pixelSize: 18
        text: sensorTitle
    }
    Text {
        id: status
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        font.family: fontFamily
        font.pixelSize: 18
        font.italic: true
        Timer {
            id: blinkStatus
            repeat: true
            interval: 100
            running: false
            onTriggered: { status.visible = !status.visible }
        }
    }

    // Function definitions ---------------------------------------------------------------------

    function close() {
        light.source = "qrc:/images/green_light.png"
        blinkStatus.running = false
        status.text = "Closed"
    }
    function open() {
        light.source = "qrc:/images/red_light.png"
        blinkStatus.running = true
        status.text = "Open"
    }
}
