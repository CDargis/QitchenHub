import QtQuick 2.0

Rectangle{
    id: twitter
    Rectangle{
        id: twTitle
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height*.095
        width: parent.width
        color: "#8b988b"
        border.color: "black"
        Rectangle{
            id: twTitleItems
            anchors.centerIn: parent
            width: parent.width*0.98
            height: parent.height*0.90
            color: "black"
            Image{
                id: twitterImage
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.005
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width*.20
                height: parent.width*.20
                smooth: true
                source: "qrc:/images/twitter.png"
            }
            Text{
                id:twText
                anchors.left: twitterImage.right
                anchors.leftMargin: parent.width*.05
                anchors.bottom: twitterImage.bottom
                font.bold: true
                font.family: "DejaVu Serif"
                font.pointSize: 25;
                text: qsTr("Twitter") + tr.emptyString
                color: "#36C60F"
            }
        }
    }
    Rectangle{
        id: twContent
        anchors.left: parent.left
        anchors.top: twTitle.bottom
        height: parent.height*0.9
        width: parent.width
        border.color: "#8b988b"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#7C7C85" }
            GradientStop { position: 1.0; color: "#25242A" }
        }
    }

    RssSettings{
        id: twitterSettings
        anchors.left: parent.left
        anchors.top: twTitle.bottom
        height: parent.height*0.9
        width: parent.width
    }

    Rectangle{
        id:twBottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height*.05
        color: "black"
        border.color: "#8b988b"
        Image {
            id: twBackArrow
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
                onClicked: hide()
            }
        }
        Image {
            id: twSettings
            source: "qrc:/images/rssSettings.png"
            smooth: true
            signal clicked
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.01
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height*0.8
            height: parent.height*0.8
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    twContent.visible = false
                    twitterSettings.visible = true
                }
            }
        }
    }
}