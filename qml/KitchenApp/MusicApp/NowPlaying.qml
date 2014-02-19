<<<<<<< HEAD
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
=======
import QtQuick 2.0
import "../"

Rectangle {
    id: root
    color: "transparent"

    property string currentTitle: ""
    property string currentAlbum: ""
    property string currentArtist: ""
    property bool loved: false
    property bool headerFlipped: false

    Flipable {
        id: header
        width: playSettingsRect.width; height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: playSettingsRect.top
        anchors.bottomMargin: 20
        front: PlayMenu {
            id: playMenu
            anchors.fill: parent
        }
        back: MusicSearch {
            id: musicSearch
            anchors.fill: parent
        }

        transform: Rotation {
            id: rotation
            origin.x: header.width / 2
            origin.y: header.height / 2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: root.headerFlipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 1000 }
        }
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
    }

    Rectangle {
        id: musicSettingsRect
        width: playSettingsRect.width; height: 30
        anchors.right: playSettingsRect.right
        anchors.bottom: playSettingsRect.bottom
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#000000" }
            GradientStop { position: 1.0; color: "#222222" }
        }
        Image {
            id: musicSettingsImg
            anchors.right: parent.right
            width: 30; height: 30
            source: (playSettingsRect.flipped) ?
                        "qrc:/images/rssBackArrow.png" : "qrc:/images/rssSettings.png"
            MouseArea {
                anchors.fill: parent
                onClicked: playSettingsRect.flipped
                           = !playSettingsRect.flipped
            }
        }
        Image {
            id: volumeImg
            anchors.left: parent.left
            width: musicSettingsImg.width; height: musicSettingsImg.height
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
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: volumeImg.right
            anchors.leftMargin: 3
            sliderWidth: 100
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
    }

    Text {
        id: songTextProgress
        anchors.verticalCenter: songProgress.verticalCenter
        anchors.right: songProgress.left
        anchors.rightMargin: 10
        font.family: fontFamily
        font.pixelSize: 14
        color: "white"
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
        Binding {
            target: theMusicPlayerApp
            property: "currentSongLength"
            value: songProgress.maximum
        }
        Binding {
            target: theMusicPlayerApp
            property: "currentProgress"
            value: songProgress.value
        }
    }

    Text {
        id: songLength
        anchors.verticalCenter: songProgress.verticalCenter
        anchors.left: songProgress.right
        anchors.leftMargin: 10
        font.family: fontFamily
        font.pixelSize: 14
        color: "white"
        text: "0:00"
    }

    Text {
        id: titleDisplay
        anchors.top: songProgress.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: playSettingsRect.horizontalCenter
        font.pixelSize: 22
        font.family: fontFamily
        text: currentTitle
        color: "white"
    }

    Text {
        id: artistDisplay
        anchors.top: titleDisplay.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: titleDisplay.horizontalCenter
        font.pixelSize: 16
        font.family: fontFamily
        text: currentArtist
        color: "white"
    }

    Text {
        id: albumDisplay
        anchors.top: artistDisplay.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: titleDisplay.horizontalCenter
        font.pixelSize: 16
        font.family: fontFamily
        text: currentAlbum
        color: "white"
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
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
