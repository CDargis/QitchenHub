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
            anchors.top: locationIn.bottom
            anchors.topMargin: 50
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
        Text {
            id: nameTitle
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 25
            font.family: fontFamily
            font.pixelSize: parent.width * 1/14
            color: "#36C60F"
            text: qsTr("Name") + tr.emptyString
        }
        VirtualInput {
            id: nameIn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: nameTitle.bottom
            anchors.topMargin: 10
            currentText: statusBar.usrName
            width: parent.width * .75; height: width * .15
            onReturnPressed: {
                statusBar.usrName = theText
            }
        }
        Text {
            id: locationTitle
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: nameIn.bottom
            anchors.topMargin: 50
            font.family: fontFamily
            font.pixelSize: parent.width * 1/14
            color: "#36C60F"
            text: qsTr("Location") + tr.emptyString
        }
        VirtualInput {
            id: locationIn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: locationTitle.bottom
            anchors.topMargin: 10
            width: parent.width * .75; height: width * .15
            currentText: "Chicago, IL"
        }
    }
}
