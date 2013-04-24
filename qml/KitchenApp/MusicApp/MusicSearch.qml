import QtQuick 2.0
import "../"

Rectangle {
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#000000" }
        GradientStop { position: 1.0; color: "#222222" }
    }
    Image {
        id: backImg
        width: 35; height: 35
        source: "qrc:/images/rssBackArrow.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                nowPlaying.headerFlipped = false
            }
        }
    }

    Text {
        id: infoText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.family: fontFamily
        font.pixelSize: 16
        color: "white"
        text: qsTr("Enter an artist and hit play!") + tr.emptyString
    }

    VirtualInput {
        id: vInput
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: infoText.bottom
        anchors.topMargin: 10
        height: 30
        width: 200
        currentText: "artist name"
    }
    Image {
        id: playPauseImg
        width: 50; height: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: infoText.right
        anchors.leftMargin: 20
        source: "qrc:/images/play_button.png"
        smooth: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                theMusicPlayerApp.artistSearch(vInput.currentText, searchSuccessHandler)
            }
        }
    }

    // Function defintions -------------------------------------------------------------

    function searchSuccessHandler(artist) {
        if(artist !== undefined) {
            theMusic.tuneToArtist(artist)
            nowPlaying.headerFlipped = false
        }
    }
}
