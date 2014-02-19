<<<<<<< HEAD
import QtQuick 2.0


//Story Section

Item {
    id: delegate
    height: 0
    width: parent.width
    opacity: 0
    Rectangle{
        id: page
        width: parent.width
        height: parent.height
        color: "black"
        Column {
            id: column
            width: parent.width
            spacing: parent.width*.05
            Text {
                id: titleText
                color: "white"
                text: ""; width: parent.width; wrapMode: Text.WordWrap
                font { bold: true; family: "Helvetica"; pointSize: 16 }
            }
            Rectangle{
                id: storyBG
                width: parent.width
                height: descriptionText.height
                color: "white"
                border.color: "#8b988b"
                Text {
                    id: descriptionText
                    color: "black"
                    width: parent.width; text: ""
                    wrapMode: Text.WordWrap; font.family: "Helvetica"
                }
            }
        }
        Rectangle{
            id: articleLink
            color: "gray"
            anchors.top: column.bottom
            anchors.topMargin: page.height*.1
            border.color: "#8b988b"
            width: parent.width*.6
            height: page.width*.1
            radius: parent.width*.01
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: articleText
                anchors.centerIn: parent
                font.pointSize: articleLink.height*.5
                text: "Read full article"; color:"white"
                wrapMode: Text.WordWrap; font.family: "Sans"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    webpage.visible = true
                }
            }
        }
    }

    states: State {
        name: "read"
        PropertyChanges { target: delegate; opacity: 1; visible: true} // Make details visible
        PropertyChanges { target: delegate; height: rssContent.height } // Fill the entire list area with the detailed view
    }

    transitions: Transition {
        ParallelAnimation {
            NumberAnimation { duration: 300; properties: "opacity,height" }
        }
    }
    function setText(){
        titleText.text = rssContent.story.title;
        var temp = rssContent.story.description.toString().replace("\"//","\"http://")
        descriptionText.text = temp;
        webpage.url = rssContent.story.link;
    }
}



//Story end
=======
import QtQuick 2.0


//Story Section

Item {
    id: delegate
    height: 0
    width: parent.width
    opacity: 0
    Rectangle{
        id: page
        width: parent.width
        height: parent.height
        color: "black"
        Column {
            id: column
            width: parent.width
            spacing: parent.width*.05
            Text {
                id: titleText
                color: "white"
                text: ""; width: parent.width; wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                font { bold: true; family: "Helvetica"; pointSize: 16 }
            }
            Rectangle{
                id: storyBG
                width: parent.width
                height: descriptionText.height
                color: "white"
                border.color: "#8b988b"
                Text {
                    id: descriptionText
                    color: "black"
                    width: parent.width; text: ""
                    wrapMode: Text.WordWrap; font.family: "Helvetica"
                }
            }
        }
        Rectangle{
            id: articleLink
            color: "gray"
            anchors.top: column.bottom
            anchors.topMargin: page.height*.1
            border.color: "#8b988b"
            width: parent.width*.6
            height: page.width*.1
            radius: parent.width*.01
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: articleText
                anchors.centerIn: parent
                font.pointSize: articleLink.height*.5
                text: "Read full article"; color:"white"
                wrapMode: Text.WordWrap; font.family: "Sans"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    webpage.visible = true
                }
            }
        }
    }

    states: State {
        name: "read"
        PropertyChanges { target: delegate; opacity: 1; visible: true} // Make details visible
        PropertyChanges { target: delegate; height: rssContent.height } // Fill the entire list area with the detailed view
    }

    transitions: Transition {
        ParallelAnimation {
            NumberAnimation { duration: 300; properties: "opacity,height" }
        }
    }
    function setText(){
        titleText.text = rssContent.story.title;
        var temp = rssContent.story.description.toString().replace("\"//","\"http://")
        descriptionText.text = temp;
        webpage.url = rssContent.story.link;
    }
}



//Story end
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
