import QtQuick 2.0
import QtMultimedia 5.0
import "MusicApp/Music.js" as Music
import "MusicApp"

AppInterface {
    id: theMusicPlayerApp
    anchors.fill: parent
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

        function loveTrack(track, artist) {
            Music.loveTrack(track, artist)
        }
    }
}
