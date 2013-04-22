import QtQuick 2.0
import QtMultimedia 5.0
import "../"

Rectangle {
    Image {
        id: playPauseImg
        width: parent.height; height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: (theMusic.playbackState === Audio.PausedState)
                ? "qrc:/images/pause_button.png" : "qrc:/images/play_button.png"
        smooth: true
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
        anchors.verticalCenter: playPauseImg.verticalCenter
        source: "qrc:/images/next_track_button.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                theMusic.nextTrack()
            }
        }
    }

    Image {
        id: volumeImg
        anchors.left: nextTrackImg.right
        width: playPauseImg.height * .5; height: playPauseImg.height * .5
        anchors.verticalCenter: playPauseImg.verticalCenter
        source: theMusic.muted ? "qrc:/images/volume_mute.png" : "qrc:/images/volume.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                theMusic.muted = !theMusic.muted
            }
        }
    }

    Slider {
        id: volume
        anchors.verticalCenter: nextTrackImg.verticalCenter
        anchors.left: volumeImg.right
        anchors.leftMargin: 3
        sliderWidth: playPauseImg.width * .9
        sliderHeight: 5
        minimum: 0
        maximum: 1
        value: 1
        Binding {
            target: theMusic
            property: "volume"
            value: volume.value
        }
        Binding {
            target: volume
            property: "enabled"
            value: theMusic.muted
        }
    }

    Image {
        id: loveImg
        anchors.right: playPauseImg.left
        anchors.rightMargin: 40
        anchors.verticalCenter: playPauseImg.verticalCenter
        height: playPauseImg.height * .55; width: playPauseImg.height * .55
        source: nowPlaying.loved ? "qrc:/images/love_glow.png" : "qrc:/images/love.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(!nowPlaying.loved) {
                    nowPlaying.loveTrack(nowPlaying.currentTitle, nowPlaying.currentArtist)
                    nowPlaying.loved = true
                }
                else {
                    nowPlaying.unLoveTrack(nowPlaying.currentTitle, nowPlaying.currentArtist)
                    nowPlaying.loved = false
                }
            }
        }
    }

    Image {
        id: banImg
        anchors.right: loveImg.left
        anchors.rightMargin: 40
        anchors.verticalCenter: playPauseImg.verticalCenter
        height: playPauseImg.height * .55; width: playPauseImg.height * .55
        source: "qrc:/images/ban.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                nowPlaying.banTrack(nowPlaying.currentTitle, nowPlaying.currentArtist)
                theMusicPlayerApp.getBanList()
                theMusic.nextTrack()
            }
        }
    }
}
