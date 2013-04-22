import QtQuick 2.0

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
        Rectangle{
            id: feedInputBox
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: feed.bottom
            height: parent.height*.20
            width: parent.width*.97
            color: "black"
            border.color: "#8b988b"
            border.width: height*.03
            TextInput{
                id: feedInput
                width: parent.width*.97
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                anchors.verticalCenter: parent.verticalCenter
                font.italic: true
                font.family: "DejaVu Serif"
                font.pixelSize: parent.height*0.5
                maximumLength: 100
                color: "white"
                text: qsTr("i.e news.yahoo.com/rss/world") + tr.emptyString
                smooth:true
                clip: true
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    feedInputBox.state = "active1"
                    feedInput.state = "active1"
                    feedInput.text = ""
                    titleInputBox.state = ""
                    titleInput.state = ""
                    feedInput.forceActiveFocus();
                }
            }
        }
        Text{
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.leftMargin: parent.width*.023
            anchors.top: feedInputBox.bottom
            anchors.topMargin: parent.height*.05
            text: qsTr("Insert the RSS feed title:") + tr.emptyString
            font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.height*.09
            color: "black"
        }
        Rectangle{
            id: titleInputBox
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: title.bottom
            height: parent.height*.20
            width: parent.width*.97
            color: "black"
            border.color: "#8b988b"
            border.width: height*.03
            TextInput{
                id: titleInput
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                anchors.verticalCenter: parent.verticalCenter
                font.italic: true
                font.family: "DejaVu Serif"
                font.pixelSize: parent.height*0.5
                maximumLength: 25
                color: "white"
                text: qsTr("feed title here...") + tr.emptyString
                smooth:true
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    titleInputBox.state = "active2"
                    titleInput.state = "active2"
                    titleInput.text = ""
                    feedInputBox.state = ""
                    feedInput.state = ""
                    titleInput.forceActiveFocus();
                }
            }
        }
        Rectangle{
            id: addButton
            anchors.top: titleInputBox.bottom
            anchors.topMargin: parent.height*.05
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.width*.1
            width: parent.width*.29
            radius: width*.05
            color: "black"
            border.color: "gray"
            border.width: height*.03
            Text{
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: parent.height*.55
                text: qsTr("Add Feed") + tr.emptyString
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    addFeed(feedInput.text,titleInput.text)
                    resetState()
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
        //radius: parent.width*.05
        /*
        Image {
            id: upArrow
            anchors.right: parent.right
            anchors.top: parent.top
            source: "qrc:/images/up-arrow-icon.png"
            width: parent.width*.15
            height: parent.width*.15
            smooth: true
        }
        Image {
            id: downArrow
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: "qrc:/images/down-arrow-icon.png"
            width: parent.width*.15
            height: parent.width*.15
            smooth: true
        }
        */
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
        feedInputBox.state = "";
        feedInput.state = ""
        titleInputBox.state = "";
        titleInput.state = ""
    }
    function addFeed(source,title){
        titleInput.text = ""
        feedInput.text = ""
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
