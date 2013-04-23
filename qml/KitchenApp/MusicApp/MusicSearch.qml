import QtQuick 2.0
import "../"

Rectangle {
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#000000" }
        GradientStop { position: 1.0; color: "#222222" }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            nowPlaying.headerFlipped = false;
        }
    }

    Text {
        id: infoText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.family: fontFamily
        font.pixelSize: 16
        color: "white"
        text: qsTr("Enter an artist and hit play!") + tr.emptyString
    }

    VirtualInput {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: infoText.bottom
        anchors.topMargin: 10
        height: 30
        width: 200
    }
}
