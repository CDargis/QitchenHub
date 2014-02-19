import QtQuick 2.0
import "../"
import "../Social"

Rectangle {
    id: musicSettingsRect
    color: "#36C60F"

    property bool useRecommendations: true

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
            onDestroyingItem: {
                console.log(item.name)
            }
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
            onDestroyingItem: {
                var result = item.name.split(" - ")
                nowPlaying.unBanTrack(result[0], result[1])
            }
        }
    }

    Rectangle {
        id: otherSettingsHeader
        color: "black"
        height: parent.height * .1
        width: parent.width / 3
        anchors.left: banListHeader.right
        Text {
            anchors.centerIn: parent
            font.family: fontFamily
            font.pixelSize: 20
            color: "#36C60F"
            text: qsTr("Settings") + tr.emptyString
        }
    }

    Text {
        id: recText
        anchors.horizontalCenter: otherSettingsHeader.horizontalCenter
        anchors.top: otherSettingsHeader.bottom
        anchors.topMargin: 20
        font.family: fontFamily
        font.pixelSize: 16
        color: "black"
        text: qsTr("Recommendations") + tr.emptyString
    }

    Toggle {
        id: recToggle
        width: 75
        height: 25
        anchors.top: recText.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: recText.horizontalCenter
        isOn: theMainApplication.musicRecommendations
        onIsOnChanged: {
            theMainApplication.musicRecommendations = isOn
            if(isOn) {
                theMusic.turnOnRecommendations()
            }
            else theMusic.turnOffRecommendations()
        }
    }

    Text {
        id: autoPlayText
        anchors.horizontalCenter: recToggle.horizontalCenter
        anchors.top: recToggle.bottom
        anchors.topMargin: 30
        font.family: fontFamily
        font.pixelSize: 16
        color: "black"
        text: qsTr("Play on Startup") + tr.emptyString
    }

    Toggle {
        width: 75
        height: 25
        anchors.top: autoPlayText.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: autoPlayText.horizontalCenter
        isOn: theMainApplication.playMusicOnStartup
        onIsOnChanged: theMainApplication.playMusicOnStartup = isOn
    }

    Rectangle {
        height: parent.height - otherSettingsHeader.height
        width: parent.width / 3
        anchors.top: otherSettingsHeader.bottom
        anchors.left: banListRect.right
        color: "transparent"
        border.color: "black"
        border.width: 1
    }

    function setUsersArtists(artists) {
        artistFlick.addItems(artists, true)
    }

    function setBanList(banList) {
        bannedFlick.addItems(banList, false)
    }
}
