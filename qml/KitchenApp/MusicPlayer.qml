import QtQuick 2.0
import QtMultimedia 5.0
import "MusicApp/Music.js" as Music
import "MusicApp"

AppInterface {
    id: theMusicPlayerApp
    anchors.fill: parent

    widgetSrc: "MusicApp/MusicPlayerWidget.qml"

    property string currentTitle: nowPlaying.currentTitle
    property string currentArtist: nowPlaying.currentArtist
    property int currentSongLength
    property int currentProgress
    property bool isPlaying: {
        (theMusic.playbackState === Audio.PlayingState) ? true : false
    }

    signal playPauseSignal()
    onPlayPauseSignal: {
        if(theMusic.playbackState === Audio.PausedState)
            theMusic.play()
        else if(theMusic.playbackState === Audio.PlayingState)
            theMusic.pause()
        else theMusic.nextTrack()
    }
    signal nextSignal()
    onNextSignal: {
        theMusic.nextTrack()
    }

    Component.onCompleted: {
        getUsersArtists()
        getBanList()
        if(theMainApplication.playMusicOnStartup) {
            if(theMainApplication.musicRecommendations)
                theMusic.turnOnRecommendations()
            else theMusic.turnOffRecommendations()
        }
        else {

        }
    }

    Audio {
        id: theMusic
        autoPlay: false
        onStatusChanged: {
            if(status === Audio.EndOfMedia)
                nextTrack()
        }

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

    function secondsToMinuteString(miliseconds) {
        return nowPlaying.secondsToMinuteString(miliseconds)
    }
}
