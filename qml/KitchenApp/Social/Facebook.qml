import QtQuick 2.0

Rectangle{
    id: facebook
    Rectangle{
        id: fbTitle
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height*.095
        width: parent.width
        color: "#8b988b"
        border.color: "black"
        Rectangle{
            id: fbTitleItems
            anchors.centerIn: parent
            width: parent.width*0.98
            height: parent.height*0.90
            color: "black"
            Text{
                id:fbText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: facebookImage.bottom
                font.bold: true
                font.family: "DejaVu Serif"
                font.pointSize: 21;
                text: qsTr("Facebook") + tr.emptyString
                color: "#36C60F"
            }
            Image{
                id: facebookImage
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.005
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width*.20
                height: parent.width*.20
                smooth: true
                source: "qrc:/images/facebook.png"
            }
        }
    }
    Rectangle{
        id: labelArea
        color: "black"
        width: parent.width
        height: timeLine.paintedHeight
        border.color: "#8b988b"
        anchors.top: fbTitle.bottom
        property bool expand: true
        Text{
            id: timeLine
            text: qsTr("Timeline") + tr.emptyString
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.width*.065
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                labelArea.expand = !labelArea.expand
                console.log(labelArea.expand)
            }
        }
    }
    Rectangle {
        id: fbContent
        height: parent.height*0.9
        width: parent.width
        anchors.top: labelArea.bottom
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#7C7C85" }
            GradientStop { position: 1.0; color: "#25242A" }
        }
        border.color: "#8b988b"
        FacebookContent{id: fbCol; width: parent.width;height: parent.height - fbBottom.height - labelArea.height + parent.width*.01}
    }
    Rectangle{
        id:fbBottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height*.05
        color: "black"
        border.color: "#8b988b"
        Image {
            id: fbBackArrow
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
            id: fbSettings
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
                onClicked: hide()
            }
        }
    }
}
