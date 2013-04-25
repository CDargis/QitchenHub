import QtQuick 2.0
import "../"


Rectangle{
    id: root
    visible: true
    color: "#36C60F"
    width: parent.width
    height: parent.height
    border.color: "#8b988b"
    Rectangle{
        id: addArea
        anchors.left: parent.left
        height: parent.height*.25
        width: parent.width
        color: "transparent"
        Text{
            id: feed
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height*.05
            text: qsTr("Insert the RSS feed URL:") + tr.emptyString
            font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.height*.09
            color: "black"
        }
        VirtualInput{
            id: feedInput
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: feed.bottom
            height: parent.height*.20
            width: parent.width*.97
            color: "black"
            border.color: "#8b988b"
            fontColor: "white"
            border.width: height*.03
            fontSize: height*.5
            currentText: qsTr("i.e news.yahoo.com/rss/world") + tr.emptyString
            onKeyboardIsVisible: {
                if(currentText === "i.e news.yahoo.com/rss/world")
                    currentText = ""
            }
        }
        Text{
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.leftMargin: parent.width*.023
            anchors.top: feedInput.bottom
            anchors.topMargin: parent.height*.05
            text: qsTr("Insert the RSS feed title:") + tr.emptyString
            font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.height*.09
            color: "black"
        }
        VirtualInput{
            id: titleInput
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: title.bottom
            height: parent.height*.20
            width: parent.width*.97
            currentText: qsTr("feed title here...") + tr.emptyString
            color: "black"
            fontColor: "white"
            maxLength: 25
            isInteractive: false
            border.color: "#8b988b"
            border.width: height*.03
            fontSize: height*.5
            onKeyboardIsVisible: {
                if(currentText === "feed title here...")
                    currentText = ""
            }
        }
        Rectangle{
            id: addButton
            anchors.top: titleInput.bottom
            anchors.topMargin: parent.height*.05
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.width*.1
            width: addText.paintedWidth
            radius: width*.05
            color: "black"
            border.color: "gray"
            border.width: height*.03
            Text{
                id: addText
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: parent.height*.55
                text: qsTr("Add Feed") + tr.emptyString
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    addText.color = "#36C60F"
                    addFeed(feedInput.currentText,titleInput.currentText)
                    resetState()
                    addText.color = "white"
                }
            }
        }
        states: [
            State {
                name: "active1"
                PropertyChanges { target: feedInputBox; border.color: "white"}
                PropertyChanges { target: feedInput; font.italic: false}
            },
            State{
                name: "active2"
                PropertyChanges { target: titleInputBox; border.color: "white"}
                PropertyChanges { target: titleInput; font.italic: false}
            }
        ]
    }
    Rectangle{
        id: seperator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: addArea.bottom
        anchors.topMargin: parent.width*.02
        color: "black"
        width: parent.width*.95
        height: parent.height*.004
    }
    Text{
        id: remove
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: parent.width*.023
        anchors.top: seperator.bottom
        anchors.topMargin: parent.height*.02
        text: qsTr("Remove Feed:") + tr.emptyString
        font.bold: true
        font.family: "Sans"
        font.pixelSize: parent.height*.25*.09
        color: "black"
    }
    Rectangle{
        id: listContainer
        anchors.top: remove.bottom
        anchors.topMargin: parent.width*.03
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"
        border.color: "gray"
        width: parent.width*.9
        height: parent.height*.4
        ListView{
            id: listFeeds
            anchors.fill: parent
            model: rssFeeds
            clip: true
            delegate: SettingsDelegate{}
        }
    }

    Rectangle{
        id: seperator2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: listContainer.bottom
        anchors.topMargin: parent.width*.06
        color: "black"
        width: parent.width*.95
        height: parent.height*.003
    }
    Text{
        id: refresh
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: parent.width*.023
        anchors.top: seperator2.bottom
        anchors.topMargin: parent.height*.02
        text: qsTr("Auto Refresh:") + tr.emptyString
        font.bold: true
        font.family: "Sans"
        font.pixelSize: parent.height*.25*.09
        color: "black"
    }
    Toggle{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: refresh.bottom
        anchors.topMargin: parent.height*.03
        isOn: false
    }

    function resetState(){
        feedInput.state = "";
        titleInput.state = "";
        addText.state = "";
        addButton.state = "";
    }
    function addFeed(source,title){
        titleInput.currentText = ""
        feedInput.currentText = ""
        rssFeeds.append({name: title, feed: source});
        console.log(rssFeeds)
        if(rss.activeFeed === null){
            rss.activeFeed = source;
        }
    }
    function setInteractive(inter){
        listFeeds.interactive = inter
    }
}
