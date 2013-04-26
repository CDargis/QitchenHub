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
    Column {
        id: mainCol
        width: parent.width; height: parent.height - heading.height - heading.anchors.topMargin
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: heading.bottom
        anchors.topMargin: 20
        spacing: parent.height * 1/14
        Column {
            width: parent.width
            spacing: 10
            Text {
                id: nameTitle
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: fontFamily
                font.pixelSize: parent.width * 1/14
                color: "#36C60F"
                text: qsTr("Name") + tr.emptyString
            }
            VirtualInput {
                id: nameIn
                anchors.horizontalCenter: parent.horizontalCenter
                currentText: statusBar.usrName
                width: parent.width * .75; height: width * .15
                onReturnPressed: {
                    statusBar.usrName = theText
                }
            }
        }
        Column {
            width: parent.width
            spacing: 10
            Text {
                id: locationTitle
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: fontFamily
                font.pixelSize: parent.width * 1/14
                color: "#36C60F"
                text: qsTr("Location") + tr.emptyString
            }
            VirtualInput {
                id: locationIn
                anchors.horizontalCenter: parent.horizontalCenter
                currentText: theMainApplication.currentLocation
                width: parent.width * .75; height: width * .15
                onReturnPressed: {
                    theMainApplication.currentLocation = currentText
                }
                Binding {
                    target: theMainApplication
                    property: "currentLocation"
                    value: locationIn.currentText
                }
            }
        }
        Column {
            id: voiceRect
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Text {
                font.family: fontFamily
                font.pixelSize: parent.width * 1/14
                color: "#36C60F"
                text: qsTr("Voice Enabled") + tr.emptyString
                anchors.horizontalCenter: parent.horizontalCenter
            }
            ToggleSwitch {
                id: voiceToggle
                width: 90
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                Binding {
                    target: theMainApplication
                    property: "voiceOn"
                    value: voiceToggle.isOn
                }
            }
            Rectangle {
                anchors.top: voiceToggle.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Image {
                    id: usrSettingsImg
                    width: parent.width * .25; height: parent.width * .25
                    anchors.top: parent.top
                    anchors.topMargin:  base.height * 1/13
                    anchors.right: mid.left
                    source: statusBar.usrPicSource
                }
                Rectangle {
                    id: mid
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 1; width: 1; color: "transparent"
                }
                Button {
                    buttonText: qsTr("Change Picture") + tr.emptyString
                    anchors.verticalCenter: usrSettingsImg.verticalCenter
                    anchors.left: mid.right
                }
            }
        }
    }
}
