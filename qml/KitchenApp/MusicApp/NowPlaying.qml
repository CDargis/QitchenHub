import QtQuick 2.0
import "../"

Rectangle {
    border.color: "black"
    border.width: 1
    color: "transparent"

    property string currentTitle: ""
    property string currentAlbum: ""
    property string currentArtist: ""

    PlayMenu {
        id: playMenu
        width: parent.width; height: 125
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: nowPlayList.top
        anchors.bottomMargin: 20
    }

    NowPlayList {
        id: nowPlayList
        anchors.centerIn: parent
        width: parent.width * .6; height: parent.height * .4
    }

    Text {
        id: songTextProgress
        anchors.verticalCenter: songProgress.verticalCenter
        anchors.right: songProgress.left
        anchors.rightMargin: 10
        font.family: fontFamily
        font.pixelSize: 14
        color: "#36C60F"
    }

    Slider {
        id: songProgress
        anchors.top: nowPlayList.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: nowPlayList.horizontalCenter
        canDrag: false
        sliderWidth: nowPlayList.width - songTextProgress.width - songLength.width - 20
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
    }

    Text {
        id: titleDisplay
        anchors.top: songProgress.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: nowPlayList.horizontalCenter
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
        songProgress.maximum = song.duration
        nowPlayList.addSong(song)
        songLength.text = secondsToMinuteString(song.duration)
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
