import QtQuick 2.0
import QtMultimedia 5.0
import "../"

Rectangle {
    Image {
        id: playPauseImg
        width: parent.height * .55; height: parent.height * .55
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: nextTrackImg.left
        anchors.rightMargin: 10
        source: (theMusic.playbackState === Audio.PausedState)
                ? "qrc:/images/pause_button.png" : "qrc:/images/play_button.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                theMusicPlayerApp.playPauseSignal()
            }
        }
    }
    Image {
        id: nextTrackImg
        width: playPauseImg.height; height: playPauseImg.height
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: playPauseImg.verticalCenter
        source: "qrc:/images/next_track_button.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                theMusicPlayerApp.nextSignal()
            }
        }
    }

    Image {
        id: loveImg
        anchors.right: playPauseImg.left
        anchors.rightMargin: 10
        anchors.verticalCenter: playPauseImg.verticalCenter
        height: nextTrackImg.height; width: nextTrackImg.height
        source: nowPlaying.loved ? "qrc:/images/love_glow.png" : "qrc:/images/love.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(!nowPlaying.loved) {
                    if(theMusic.playbackState === Audio.PlayingState) {
                        nowPlaying.loveTrack(nowPlaying.currentTitle, nowPlaying.currentArtist)
                        nowPlaying.loved = true
                    }
                }
                else {
                    if(theMusic.playbackState === Audio.PlayingState) {
                        nowPlaying.unLoveTrack(nowPlaying.currentTitle, nowPlaying.currentArtist)
                        nowPlaying.loved = false
                    }
                }
            }
        }
    }

    Image {
        id: banImg
        anchors.right: loveImg.left
        anchors.rightMargin: 10
        anchors.verticalCenter: playPauseImg.verticalCenter
        height: nextTrackImg.height; width: nextTrackImg.height
        source: "qrc:/images/ban.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(theMusic.playbackState === Audio.PlayingState) {
                    nowPlaying.banTrack(nowPlaying.currentTitle, nowPlaying.currentArtist)
                    theMusicPlayerApp.getBanList()
                    theMusic.nextTrack()
                }
            }
        }
    }
}
