import QtQuick 2.0
import "../"

Rectangle {
    id: base
    property int headingSize: 16

    Text {
        id: heading
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        font.family: fontFamily
        font.pixelSize: headingSize
        font.bold: true
        color: "#36C60F"
        text: qsTr("User") + tr.emptyString
    }
    Rectangle {
        width: parent.width; height: parent.height - heading.height - heading.anchors.topMargin
        anchors.top: heading.bottom
        color: "transparent"
        Image {
            id: usrSettingsImg
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.right: middle.left
            anchors.rightMargin: 20
            width: parent.width * .25; height: parent.width * .25
            source: statusBar.usrPicSource
        }
        Rectangle {
            id: middle
            height: 1; width: 1
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"
        }
        Button {
            anchors.left: middle.right
            anchors.leftMargin: 10
            anchors.verticalCenter: usrSettingsImg.verticalCenter
            buttonText: qsTr("Change Picture") + tr.emptyString
        }
        Rectangle {
            id: topMidDiv
            height: 1; width: parent.width * .85
            anchors.top: usrSettingsImg.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#36C60F"
        }
        Text {
            id: nameTitle
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: topMidDiv.bottom
            anchors.topMargin: 40
            font.family: fontFamily
            font.pixelSize: parent.width * 1/14
            color: "#36C60F"
            text: qsTr("Name") + tr.emptyString
        }
        Rectangle {
            id: textInRect
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: nameTitle.bottom
            anchors.topMargin: 10
            border.color: "black"
            border.width: 1
            width: parent.width * .75; height: width * .15
            TextInput {
                id: nameInput
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.family: fontFamily
                font.pixelSize: nameTitle.font.pixelSize
                text: statusBar.usrName
            }
        }
    }
}
