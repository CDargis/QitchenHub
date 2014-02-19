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

    Flipable {
        id: rssMain
        property var story;
        anchors.left: parent.left
        anchors.top: rssTitle.bottom
        height: parent.height*0.9
        width: parent.width
        visible: true
        property bool flipped: false
        front:RssContent{
            id: rssContent
            height: parent.height
            width: parent.width
        }
        back:RssSettings{
            id: rssSettings
            height: parent.height
            width: parent.width
        }
        transform: Rotation {
            id: rotation
            origin.x: rssMain.width/2
            origin.y: rssMain.height/2
            axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: 0    // the default angle
        }

        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: rssMain.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 300}
        }
    }
    Story{
        id: page
        visible: false
        anchors.top: rssTitle.bottom
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
                    rssContent.setInteractive(true)
                    rssContent.visible = true;
                    root.setCorrection();
                    rssSettings.resetState();
                    rssBackArrow.visible = false
                    rssSettingsButton.visible = true
                    page.state = ""
                    webpage.visible = false;
                    webpage.url = "";
                    rssSettings.visible = false;
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
                    rssContent.setInteractive(false)
                    rssSettings.visible = true
                    rssMain.flipped = true
                    rssBackArrow.visible = true
                    rssSettingsButton.visible = false
                    rssContent.visible = false
                }
            }
        }
    }
    function setCorrection(){
        if(rssMain.flipped == false && page.visible == true){
            page.visible = false;
            rssMain.visible = true;
        }
        else{
            rssMain.flipped = false;
        }
    }
}
