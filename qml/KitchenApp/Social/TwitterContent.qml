<<<<<<< HEAD
import QtQuick 2.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "white"
    border.color: "#8b988b"
    Rectangle{
        id: labelArea
        color: "black"
        width: parent.width
        height: tweetLabel.paintedHeight
        border.color: "#8b988b"
        Text{
            id: tweetLabel
            text: qsTr("Tweets") + tr.emptyString
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.bold: true
            font.family: "Sans"
            font.pixelSize: root.height*.03
        }
    }
    ListView {
        id: twFeeds
        anchors.top: labelArea.bottom
        width: parent.width
        height: parent.height
        model: TwitterModel{}
        delegate: TwitterFeedDelegate{}
        clip: true
    }
    function setActive(inter){
        twFeeds.interactive = inter
    }
}
=======
import QtQuick 2.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "white"
    border.color: "#8b988b"
    ListView {
        id: twFeeds
        width: parent.width
        height: parent.height - twBottom.height - labelArea.height + parent.width*.013
        model: TwitterModel{}
        delegate: TwitterFeedDelegate{}
        clip: true
    }
    function setActive(inter){
        twFeeds.interactive = inter
    }
    states: [
        State {
            name: "collasped"
            PropertyChanges {
                target: twFeeds
                height: 0
            }
            when: labelArea.expand
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { target: twFeeds; property: "height"; duration: 400 }
        }
    ]
}
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
