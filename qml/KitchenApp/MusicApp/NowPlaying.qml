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
        width: playSettingsRect.width; height: 125
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: playSettingsRect.top
        anchors.bottomMargin: 20
    }

    Rectangle {
        id: playSettingsRect
        anchors.centerIn: parent
        property bool flipped: false
        color: "transparent"
        width: parent.width * .6; height: parent.height * .4
        NowPlayList {
            id: nowPlayList
            anchors.fill: parent
            visible: !playSettingsRect.flipped
        }
        MusicSettings {
            id: musicSettings
            height: parent.height - musicSettingsImg.height
            width: parent.width
            visible: playSettingsRect.flipped
        }
        Image {
            id: musicSettingsImg
            anchors.right: playSettingsRect.right
            anchors.bottom: playSettingsRect.bottom
            width: 35; height: 35
            source: (playSettingsRect.flipped) ?
                        "qrc:/images/rssBackArrow.png" : "qrc:/images/rssSettings.png"
            MouseArea {
                anchors.fill: parent
                onClicked: playSettingsRect.flipped
                           = !playSettingsRect.flipped
            }
        }
    }

    Rectangle {
        anchors.fill: playSettingsRect
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
        anchors.top: playSettingsRect.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: playSettingsRect.horizontalCenter
        canDrag: false
        sliderWidth: playSettingsRect.width - songTextProgress.width - songLength.width - 20
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
        anchors.horizontalCenter: playSettingsRect.horizontalCenter
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

    function setBanList(banList) {
        musicSettings.setBanList(banList)
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
