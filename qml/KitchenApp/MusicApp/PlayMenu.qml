import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    Image {
        id: playPauseImg
        width: parent.height; height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: (theMusic.playbackState === Audio.PausedState)
                ? "qrc:/images/pause_button.png" : "qrc:/images/play_button.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(theMusic.playbackState === Audio.PausedState)
                    theMusic.play()
                else if(theMusic.playbackState === Audio.PlayingState)
                    theMusic.pause()
                else theMusic.nextTrack()
            }
        }
    }
    Image {
        id: nextTrackImg
        width: playPauseImg.height * .75; height: playPauseImg.height * .75
        anchors.left: playPauseImg.right
        anchors.leftMargin: 10
        anchors.verticalCenter: playPauseImg.verticalCenter
        source: "qrc:/images/next_track_button.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                theMusic.nextTrack()
            }
        }
    }
}
