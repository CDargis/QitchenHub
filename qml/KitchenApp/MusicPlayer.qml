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
    }

    Button {
        id: auth
        buttonText: "Auth"
        onButtonClick: Music.authenticate()
    }

    Button {
        id: center
        anchors.left: auth.right
        anchors.leftMargin: 10
        width: 200
        height: 100
        buttonText: "Tune"
        onButtonClick: {
            Music.tune("user", "chrisdargis", "mix")
        }
    }
    Button {
        id: right
        anchors.left: center.right
        anchors.leftMargin: 10
        anchors.verticalCenter: center.verticalCenter
        width: 200
        height: 100
        buttonText: "Get Playlist"
        onButtonClick: {
            Music.getPlaylist()
        }
    }
    NowPlaying {
        id: nowPlaying
        width: parent.width
        height: parent.height * (3/4)
        anchors.bottom: parent.bottom
    }
}
