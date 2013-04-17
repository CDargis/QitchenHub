import QtQuick 2.0

Item {
    id: delegate
    width: delegate.ListView.view.width; height: delegate.ListView.view.height*.06
    property int collapseHeight: delegate.ListView.view.height*.06
    ListModel {id: feedTitles}
    Rectangle {
        id: container
        width: parent.width; height:collapseHeight; anchors.left: parent.left
        color: "transparent"
        anchors.top: parent.top
        Rectangle{
            id: titleArea
            anchors.top: parent.top
            width: parent.width
            height: parent.height
            border.color: "#8b988b";
            color: delegate.ListView.isCurrentItem ? "#36C60F" : "black"
            radius: delegate.width*.03
            Text {
                id: feedName
                text: name
                color: delegate.ListView.isCurrentItem ? "black" : "white"
                font { family: "Sans"; pixelSize: collapseHeight*.5; bold: true }
                anchors {
                    left: parent.left; leftMargin: parent.width*.04
                    verticalCenter: parent.verticalCenter
                }
            }
            Image {
                id: actionBox
                source: delegate.ListView.isCurrentItem ? "qrc:/images/expand.png" : "qrc:/images/expand1.png"
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.04
                anchors.verticalCenter: parent.verticalCenter
                signal clicked
                width: delegate.width*.1
                height: delegate.width*.1
                smooth: true
            }
            MouseArea {
                anchors.fill: titleArea
                onClicked: {
                    rss.activeFeed = feed
                    delegate.ListView.view.currentIndex = index
                    changeState()
                    console.log(container);
                }
            }
        }
        ListView{
            id: feedView
            width: parent.width
            height: 0
            anchors.left: parent.left
            anchors.top: container.bottom
            model: feedTitles
            opacity: 0
            delegate: FeedDelegate{}
            clip: true
        }
    }
    states: [
        State {
            name: "expanded"
            PropertyChanges {
                target: actionBox
                source: delegate.ListView.isCurrentItem ? "qrc:/images/collapse.png" : "qrc:/images/collapse1.png"
            }
            PropertyChanges {
                target: feedView
                opacity: 1.0
                height: parent.height*5
            }
            PropertyChanges {
                target: delegate
                opacity: 1.0
                height: collapseHeight+feedView.height
            }
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { target: feedView; property: "height"; duration: 400 }
            NumberAnimation { target: feedView; property: "opacity"; duration: 400 }
        }
    ]

    function changeState(){
        if (delegate.state == "expanded")
        {
            console.log(feedTitles.count);
            delegate.state = "";
            feedTitles.clear();
            rss.activeFeed = ""
            console.log("title collapsed");
        }
        else
        {
            discovery.temp = feedTitles;
            discovery.action = 1;
            delegate.state = "expanded"
            console.log("tile expanded");
        }
    }
}
