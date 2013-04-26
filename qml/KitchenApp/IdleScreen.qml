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
        interval: 500
        onTriggered: {
            var date = new Date();
            dateText.text = (date.getMonth() + 1) + " / "
                    + (date.getDate())  + " / "
                    + date.getFullYear()
            var hours = (date.getHours() < 10) ? "0" + date.getHours() : date.getHours()
            var mins = (date.getMinutes() < 10) ? "0" + date.getMinutes() : date.getMinutes()
            var secs = (date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds()
            timeText.text = hours + ":" + mins + ":" + secs
        }
    }
    Text {
        id: dateText
        anchors.bottom: center.top
        anchors.bottomMargin: 40
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
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: fontFamily
        font.pixelSize: 80
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.visible = false
    }
}
