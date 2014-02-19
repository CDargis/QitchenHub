import QtQuick 2.0

Item {
    id: delegate
    width: delegate.ListView.view.width; height: delegate.ListView.view.height*.06
    property int collapseHeight: delegate.ListView.view.height*.06
    property bool activeStatus: false
    ListModel {id: feedTitles}
    Rectangle {
        id: container
        width: parent.width; height:parent.height; anchors.left: parent.left
        color: "transparent"
        anchors.top: parent.top
        Rectangle{
            id: titleArea
            anchors.top: parent.top
            width: parent.width
            height: delegate.collapseHeight
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
                    delegate.ListView.view.currentIndex = index
                    changeState()
                }
            }
        }
        ListView{
            id: feedView
            property int trueHeight: collapseHeight*5
            width: parent.width
            height: 0
            anchors.left: parent.left
            anchors.top: titleArea.bottom
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
                height: expandHeight()
            }
            PropertyChanges {
                target: delegate
                opacity: 1.0
                height: feedView.height
            }
            when: statusCheck()
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { target: feedView; property: "height"; duration: 400 }
            NumberAnimation { target: feedView; property: "opacity"; duration: 400 }
        }
    ]

    function changeState(){
        if (delegate.state == "expanded" && delegate.ListView.isCurrentItem)
        {
            console.log(feedTitles.count);
            feedTitles.clear();
            rss.activeFeed = ""
            activeStatus = false;
            console.log("title collapsed");
        }
        else if(delegate.state == "" && delegate.ListView.isCurrentItem)
        {
            activeStatus = true;
            rss.activeFeed = feed;
            discovery.temp = feedTitles;
            discovery.action = 1;
            console.log("tile expanded");
        }
    }
    function statusCheck(){
        if(delegate.ListView.isCurrentItem && activeStatus == true){
            return true;
        }
        else{
            delegate.activeStatus = false;
            return false;
        }
    }
    function expandHeight(){
        var feedHeight = (feedView.trueHeight*.15)*feedView.count;
        var needHeight = collapseHeight*(feeds.count);
        if(feedHeight > rssContent.height){
            return rssContent.height - needHeight;
        }
        else if(feedView.count == 0){
            return (feedView.trueHeight)*.15 + collapseHeight
        }
        else if(feedHeight < rssContent.height && feedHeight < needHeight){
            return feedHeight;
        }
        else{
            return rssContent.height - feedHeight - (feedView.trueHeight*.15) ;
        }
    }
}
