import QtQuick 2.0
import "../"

Rectangle {
    id: musicSettingsRect
    color: "#36C60F"

    Rectangle {
        id: artistHeader
        color: "black"
        height: parent.height * .1
        width: parent.width / 3
        Text {
            anchors.centerIn: parent
            font.family: fontFamily
            font.pixelSize: 20
            color: "#36C60F"
            text: qsTr("Favorite Artists") + tr.emptyString
        }
    }

    Rectangle {
        id: artistRect
        height: parent.height - artistHeader.height
        width: parent.width / 3
        anchors.top: artistHeader.bottom
        color: "transparent"
        border.color: "black"
        border.width: 1
        FlickableList {
            id: artistFlick
        }
    }

    Rectangle {
        id: banListHeader
        color: "black"
        height: parent.height * .1
        width: parent.width / 3
        anchors.left: artistHeader.right
        Text {
            anchors.centerIn: parent
            font.family: fontFamily
            font.pixelSize: 20
            color: "#36C60F"
            text: qsTr("Banned Tracks") + tr.emptyString
        }
    }

    Rectangle {
        id: banListRect
        height: parent.height - banListHeader.height
        width: parent.width / 3
        anchors.top: banListHeader.bottom
        anchors.left: artistRect.right
        color: "transparent"
        border.color: "black"
        border.width: 1
        FlickableList {
            id: bannedFlick
        }
    }

    function setUsersArtists(artists) {
        artistFlick.addItems(artists)
    }

    function setBanList(banList) {
        bannedFlick.addItems(banList)
    }
}
