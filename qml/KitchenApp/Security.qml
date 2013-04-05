import QtQuick 2.0

Rectangle {

    Component.onCompleted: {
        frontDoorSensor.close()
        backDoorSensor.close()
        basementDoorSensor.close()
        garageDoorSensor.close()
    }

    color: "transparent"
    border.color: "black"
    border.width: 1

    property bool locked: true

    Rectangle {
        id: titleRect
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width; height: parent.height * (1/5)
        color: "transparent"
        Text {
            anchors.centerIn: parent
            font.family: fontFamily
            font.pointSize: 30
            text: "Home Security"
        }
    }
    Rectangle {
        id: lockRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleRect.bottom
        width: parent.width; height: parent.height * (2/5)
        color: "transparent"
        Image {
            id: theLock
            width: parent.height * .75; height: parent.height * .75
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                anchors.fill: parent
                onClicked: { toggle() }
            }
        }
        Rectangle {
            id: armedBackground
            width: theLock.width; height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: theLock.bottom
            anchors.topMargin: 10
            radius: 10
            Text {
                id: armed
                font.family: fontFamily
                font.pixelSize: 20
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: { toggle() }
            }
        }
    }
    Rectangle {
        id: sensorRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: lockRect.bottom
        width: parent.width; height: parent.height * (2/5)
        color: "transparent"
        Sensor {
            id: frontDoorSensor
            width: parent.width * .60
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            sensorTitle: "Front Door"
        }
        Sensor {
            id: backDoorSensor
            width: parent.width * .60
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: frontDoorSensor.bottom
            anchors.topMargin: 10
            sensorTitle: "Back Door"
        }
        Sensor {
            id: basementDoorSensor
            width: parent.width * .60
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: backDoorSensor.bottom
            anchors.topMargin: 10
            sensorTitle: "Basement Door"
        }
        Sensor {
            id: garageDoorSensor
            width: parent.width * .60
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: basementDoorSensor.bottom
            anchors.topMargin: 10
            sensorTitle: "Garage Door"
        }
    }

    // Function definitions --------------------------------------------------------

    // "Unlock" the house
    function unLock() {
        locked = false
        theLock.source = "qrc:/images/unlock.png"
        armed.text = "Unarmed"
        armedBackground.color = "#AAFF0000"
    }

    // "Lock" the house
    function lock() {
        locked = true
        theLock.source = "qrc:/images/lock.png"
        armed.text = "Armed"
        armedBackground.color = "#AA2CFF14"
    }

    function toggle() {
        if(locked)
            unLock()
        else lock()
    }

    function getSecurityStatus() { return locked }
}
