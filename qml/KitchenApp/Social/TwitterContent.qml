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
