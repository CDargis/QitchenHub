import QtQuick 2.0
import QtMultimedia 5.0
import "../"

Rectangle {
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#000000" }
        GradientStop { position: 1.0; color: "#222222" }
    }
    Image {
        id: playPauseImg
        width: parent.height * .65; height: parent.height * .65
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

    Image {
        id: searchImg
        anchors.right: banImg.left
        anchors.rightMargin: 10
        anchors.verticalCenter: playPauseImg.verticalCenter
        height: nextTrackImg.height; width: nextTrackImg.height
        source: "qrc:/images/search.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
            }
        }
    }

    Text {
        id: currentStationText
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.family: fontFamily
        font.pixelSize: 22
        color: "white"
        text: {
            statusBar.usrName + "'s " +
                    ((theMainApplication.musicRecommendations) ?
                        qsTr("Mix Radio") : qsTr("Library Radio"))
                    + tr.emptyString
        }
    }
}
