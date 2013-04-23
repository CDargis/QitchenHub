import QtQuick 2.0
import "../"

WidgetInterface {
    id: root
    height: 175

    Rectangle {
        anchors.fill: parent
        radius: 10
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#222222" }
            GradientStop { position: 1.0; color: "#444444" }
        }
    }
    Text {
        id: currentTitle
        anchors.bottom: currentArtist.top
        anchors.bottomMargin: 5
        horizontalAlignment: Text.AlignHCenter
        font.family: fontFamily
        font.pixelSize: 12
        wrapMode: Text.Wrap
        color: "white"
        text: app.currentTitle
        width: parent.width
    }
    Text {
        id: currentArtist
        anchors.bottom: sliderProgress.top
        anchors.bottomMargin: 20
        horizontalAlignment: Text.AlignHCenter
        font.family: fontFamily
        font.pixelSize: 14
        font.bold: true
        wrapMode: Text.Wrap
        color: "white"
        text: app.currentArtist
        width: parent.width
    }
    Slider {
        id: sliderProgress
        anchors.centerIn: parent
        width: parent.width * .85
        sliderWidth: 8
        sliderHeight: 3
        canDrag: false
        maximum: app.currentSongLength
        value: app.currentProgress
        onMaximumChanged: {
            songDuration.text = app.secondsToMinuteString(maximum)
        }
        onValueChanged: {
            songProgess.text = app.secondsToMinuteString(value)
        }
    }
    Text {
        id: songProgess
        anchors.top: sliderProgress.bottom
        anchors.topMargin: 5
        anchors.left: sliderProgress.left
        font.family: fontFamily
        font.pixelSize: 11
        color: "white"
    }
    Text {
        id: songDuration
        anchors.top: sliderProgress.bottom
        anchors.topMargin: 5
        anchors.right: sliderProgress.right
        font.family: fontFamily
        font.pixelSize: 11
        color: "white"
    }
    Row {
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: sliderProgress.bottom
        anchors.topMargin: 20
        Image {
            id: playPauseImg
            width: 45; height: 45
            source: (!app.isPlaying)
                    ? "qrc:/images/pause_button.png" : "qrc:/images/play_button.png"
            smooth: true
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.playPauseSignal()
                }
            }
        }
        Image {
            id: nextSongImg
            width: 45; height: 45
            source: "qrc:/images/next_track_button.png"
            smooth: true
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.nextSignal()
                }
            }
        }
    }
}
