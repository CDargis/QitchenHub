import QtQuick 2.0
import "../"

Rectangle {
    border.color: "black"
    border.width: 1
    color: "transparent"

    property string currentTitle: ""
    property string currentAlbum: ""
    property string currentArtist: ""
    property bool loved: false

    PlayMenu {
        id: playMenu
        width: flip.width; height: 125
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: flip.top
        anchors.bottomMargin: 20
    }

    Flipable {
        id: flip
        anchors.centerIn: parent
        property bool flipped: false
        width: parent.width * .6; height: parent.height * .4
        front: NowPlayList {
            id: nowPlayList
            anchors.fill: parent
        }
        back: MusicSettings {
            id: musicSettings
            anchors.fill: parent
        }
        Image {
            anchors.right: flip.right
            anchors.bottom: flip.bottom
            width: 35; height: 35
            source: (flip.flipped) ? "qrc:/images/rssBackArrow.png" : "qrc:/images/rssSettings.png"
            MouseArea {
                anchors.fill: parent
                onClicked: flip.flipped = !flip.flipped
            }
        }
        transform: Rotation {
                 id: rotation
                 origin.x: flip.width/2
                 origin.y: flip.height/2
                 axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
                 angle: 0    // the default angle
             }

             states: State {
                 name: "back"
                 PropertyChanges { target: rotation; angle: 180 }
                 when: flip.flipped
             }

             transitions: Transition {
                 NumberAnimation { target: rotation; property: "angle"; duration: 1000 }
             }
    }

    Rectangle {
        anchors.fill: flip
        color: "transparent"
        border.color: "black"
        border.width: 1
    }

    Text {
        id: songTextProgress
        anchors.verticalCenter: songProgress.verticalCenter
        anchors.right: songProgress.left
        anchors.rightMargin: 10
        font.family: fontFamily
        font.pixelSize: 14
        color: "#36C60F"
        text: "0:00"
    }

    Slider {
        id: songProgress
        anchors.top: flip.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: flip.horizontalCenter
        canDrag: false
        sliderWidth: flip.width - songTextProgress.width - songLength.width - 20
        sliderHeight: 6
    }

    Text {
        id: songLength
        anchors.verticalCenter: songProgress.verticalCenter
        anchors.left: songProgress.right
        anchors.leftMargin: 10
        font.family: fontFamily
        font.pixelSize: 14
        color: "#36C60F"
        text: "0:00"
    }

    Text {
        id: titleDisplay
        anchors.top: songProgress.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: flip.horizontalCenter
        font.pixelSize: 22
        font.family: fontFamily
        text: currentTitle
        color: "#36C60F"
    }

    Text {
        id: artistDisplay
        anchors.top: titleDisplay.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: titleDisplay.horizontalCenter
        font.pixelSize: 16
        font.family: fontFamily
        text: currentArtist
        color: "#36C60F"
    }

    Text {
        id: albumDisplay
        anchors.top: artistDisplay.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: titleDisplay.horizontalCenter
        font.pixelSize: 16
        font.family: fontFamily
        text: currentAlbum
        color: "#36C60F"
    }

    // Function definitions -------------------------------------------------

    function addSong(song) {
        currentTitle = song.title
        currentArtist = song.artist
        currentAlbum = song.album
        loved = song.loved
        songProgress.maximum = song.duration
        nowPlayList.addSong(song)
        songLength.text = secondsToMinuteString(song.duration)
    }

    function setUsersArtists(artists) {
        musicSettings.setUsersArtists(artists)
    }

    function updateProgress(progress) {
        songProgress.value = progress
        songTextProgress.text = secondsToMinuteString(progress)
    }

    function secondsToMinuteString(miliseconds) {
        var minutes = Math.floor((miliseconds / 1000) / 60)
        var seconds = Math.round((miliseconds / 1000) % 60)
        return minutes + ":" + ((seconds < 10) ? ("0" + seconds) : seconds)
    }
}
