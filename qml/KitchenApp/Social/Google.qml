import QtQuick 2.0

Rectangle{
    id: google
    Rectangle{
        id: gpTitle
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height*.095
        width: parent.width
        color: "#8b988b"
        border.color: "black"
        Rectangle{
            id: gpTitleItems
            anchors.centerIn: parent
            width: parent.width*0.98
            height: parent.height*0.90
            color: "black"
            Image{
                id: googleImage
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.005
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width*.20
                height: parent.width*.20
                smooth: true
                source: "qrc:/images/googleplus.png"
            }
            Text{
                id:gpText
                anchors.left: googleImage.right
                anchors.leftMargin: parent.width*.05
                anchors.bottom: googleImage.bottom
                font.bold: true
                font.family: "DejaVu Serif"
                font.pointSize: 25;
                text: qsTr("Google+") + tr.emptyString
                color: "#36C60F"
            }
        }
    }
    Rectangle{
        id: labelArea
        color: "black"
        width: parent.width
        height: parent.height*.03
        border.color: "#8b988b"
        anchors.top: gpTitle.bottom
        Text{
            id: timeLine
            text: qsTr("Timeline") + tr.emptyString
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.height
        }
    }
    Rectangle {
        id: gpContent
        height: parent.height*0.9
        width: parent.width
        anchors.top: labelArea.bottom
        anchors.topMargin: parent.height*.0011
        GoogleContent{id: gpCol; width: parent.width;height: parent.height}
    }
    Rectangle{
        id:gpBottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height*.05
        color: "black"
        border.color: "#8b988b"
        Image {
            id: gpBackArrow
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
            id: gpSettings
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
