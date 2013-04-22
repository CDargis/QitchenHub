import QtQuick 2.0
import QtMultimedia 5.0
import "MusicApp/Music.js" as Music
import "MusicApp"

AppInterface {
    id: theMusicPlayerApp
    anchors.fill: parent

    widgetSrc: "MusicApp/MusicPlayerWidget.qml"

    Component.onCompleted: {
        getUsersArtists()
        getBanList()
        if(theMainApplication.playMusicOnStartup)
            Music.nextTrack()
        if(theMainApplication.musicRecommendations)
            theMusic.turnOnRecommendations()
        else theMusic.turnOffRecommendations()
    }

    Audio {
        id: theMusic
        autoPlay: false
        onPlaybackStateChanged: {
            // Update timer
            if(theMusic.playbackState === Audio.PlayingState) {
                progressTimer.running = true
            }
            else if(theMusic.playbackState === Audio.StoppedState) {
                progressTimer.running = false
            }
            else if(theMusic.playbackState === Audio.PausedState) {
                progressTimer.running = false
            }
        }

        function nextTrack() { Music.nextTrack() }

        function turnOnRecommendations() {
            Music.tune("user", Music.user, "mix")
        }

        function turnOffRecommendations() {
            Music.tune("user", Music.user, "library")
        }
    }
    // Tell the player the progress
    Timer {
        id: progressTimer
        interval: 500
        repeat: true
        running: false
        onTriggered: {
            nowPlaying.updateProgress(theMusic.position)
        }
    }

    NowPlaying {
        id: nowPlaying
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

        function banTrack(track, artist) {
            Music.banTrack(track, artist)
        }

        function unBanTrack(track, artist) {
            Music.unBanTrack(track, artist)
        }

        function loveTrack(track, artist) {
            Music.loveTrack(track, artist)
        }

        function unLoveTrack(track, artist) {
            Music.unLoveTrack(track, artist)
        }
    }

    function getBanList() {
        Music.getBanList()
    }

    function getUsersArtists() {
        Music.getUsersArtists()
    }

    function setUsersArtists(artists) {
        musicSettings.setUsersArtists(artists)
    }
}
