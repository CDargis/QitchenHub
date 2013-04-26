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
