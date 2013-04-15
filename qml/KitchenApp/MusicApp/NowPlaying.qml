import QtQuick 2.0
import "../"

Rectangle {
    border.color: "black"
    border.width: 1
    color: "transparent"

    property string currentTitle: ""
    property string currentAlbum: ""
    property string currentArtist: ""
    property string currentPicSource: ""

    NowPlayList {
        id: nowPlayList
        anchors.centerIn: parent
        width: parent.width * .6; height: parent.height * .6
    }

    Text {
        anchors.top: nowPlayList.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: nowPlayList.horizontalCenter
        font.pixelSize: 22
        font.family: fontFamily
        text: currentTitle + " - " + currentArtist
    }

    function addItem(song) { nowPlayList.addItem(song) }
}
