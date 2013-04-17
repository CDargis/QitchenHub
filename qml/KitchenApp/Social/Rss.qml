import QtQuick 2.0
import QtWebKit 3.0

Rectangle{
    id: root
    property string activeFeed
    Rectangle{
        id: rssTitle
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height*.095
        width: parent.width
        color: "#8b988b"
        border.color: "black"
        Rectangle{
            id: rssTitleItems
            anchors.centerIn: parent
            width: parent.width*0.98
            height: parent.height*0.90
            color: "black"
            Image{
                id: rssImage
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.005
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width*.20
                height: parent.width*.20
                smooth: true
                source: "qrc:/images/rss.png"
            }
            Text{
                id:rssText
                anchors.left: rssImage.right
                anchors.leftMargin: parent.width*.05
                anchors.bottom: rssImage.bottom
                font.bold: true
                font.family: "DejaVu Serif"
                font.pointSize: 25;
                text: qsTr("RSS") + tr.emptyString
                color: "#36C60F"
            }
        }
    }
    Rectangle{
        id: rssContent
        property var story;
        anchors.left: parent.left
        anchors.top: rssTitle.bottom
        height: parent.height*0.9
        width: parent.width
        visible: true
        border.color: "#8b988b"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#7C7C85" }
            GradientStop { position: 1.0; color: "#25242A" }
        }
        clip: true
        ListView {
            focus: true
            id: feeds
            anchors.fill: parent
            model: rssFeeds
            delegate: SourceDelegate{}
            clip: true
        }


        function viewStory(){
            rssContent.visible = false;
            rssBackArrow.visible = true
            page.state = "read";
        }

    }
    Story{
        id: page
        visible: false
        anchors.top: rssTitle.bottom
    }
    Rectangle{
        id: test
        anchors.top: rssTitle.bottom
        width: parent.width
        height: parent.height*.9
        border.color: "#8b988b"
        visible: false
        color: "black"
        WebView {
            id: webpage
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.top: rssTitle.bottom
            url: ""
            width: parent.width
            height: parent.height
            smooth: false
            //visible: false
        }
    }

    RssSettings{
        id: rssSettings
        anchors.left: parent.left
        anchors.top: rssTitle.bottom
        height: parent.height*0.9
        width: parent.width
    }
    Rectangle{
        id:rssBottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height*.05
        color: "black"
        border.color: "#8b988b"
        Image {
            id: rssBackArrow
            source: "qrc:/images/rssBackArrow.png"
            smooth: true
            signal clicked
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.01
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height*0.8
            height: parent.height*0.8
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rssSettings.resetState();
                    rssSettings.visible = false
                    rssContent.visible = true
                    rssBackArrow.visible = false
                    rssSettingsButton.visible = true
                    page.state = ""
                    test.visible = false;
                    webpage.url = "";
                }
            }
        }
        Image {
            id: rssSettingsButton
            source: "qrc:/images/rssSettings.png"
            smooth: true
            signal clicked
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.01
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height*0.8
            height: parent.height*0.8
            visible: true
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rssContent.visible = false
                    rssSettings.visible = true
                    rssBackArrow.visible = true
                    rssSettingsButton.visible = false
                }
            }
        }
    }
}
