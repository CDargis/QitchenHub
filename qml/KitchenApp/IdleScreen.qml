import QtQuick 2.0

Rectangle {
    id: root
    anchors.fill: parent
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#36C60F" }
        GradientStop { position: 1.0; color: "#2B950A" }
    }
    Timer {
        id: refreshTimer
        running: true
        repeat: true
        interval: 1000
        onTriggered: {
            var date = new Date();
            dateText.text = (date.getMonth() + 1) + " / "
                    + (date.getDate())  + " / "
                    + date.getFullYear()
            timeText.text = date.getHours() + ":"
                    + date.getMinutes() + ":"
                    + date.getSeconds();
        }
    }
    Text {
        id: dateText
        anchors.bottom: center.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: fontFamily
        font.pixelSize: 100
    }
    Rectangle {
        id: center
        height: 1;
        anchors.centerIn: parent
    }

    Text {
        id: timeText
        anchors.top: center.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: fontFamily
        font.pixelSize: 75
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.visible = false
    }
}
