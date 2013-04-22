import QtQuick 2.0

Rectangle{
    id: root
    visible: true
    color: "#36C60F"
    anchors.fill: parent
    border.color: "#8b988b"
    property string user: "stephenasmith"
    ListView {
        id: userInfo
        width: parent.width
        height: parent.height*.33
        model: TwitterUserModel{}
        delegate: UserHeaderDelegate{}
    }
    Rectangle{
        id: seperator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: userInfo.bottom
        anchors.topMargin: parent.height*.1
        color: "black"
        width: parent.width*.95
        height: parent.height*.003
    }

    Text{
        id: userLabel
        font.bold: true
        font.pixelSize: parent.height*.03
        anchors.top: seperator.bottom
        anchors.topMargin: parent.height*.03
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"
        font.family: "Sans"
        text: "User Name:"
    }
    Rectangle{
        id: userBox
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: userLabel.bottom
        anchors.topMargin: parent.height*.02
        height: parent.height*.06
        width: parent.width*.55
        color: "black"
        border.color: "#8b988b"
        border.width: height*.03
        TextInput{
            id: userInput
            anchors.left: parent.left
            anchors.leftMargin: parent.width*.02
            anchors.verticalCenter: parent.verticalCenter
            font.family: "DejaVu Serif"
            font.pixelSize: parent.height*0.4
            maximumLength: 15
            color: "white"
            text: user + tr.emptyString
            smooth:true
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                userInput.text = ""
                userInput.forceActiveFocus();
            }
        }
    }
    Rectangle{
        id: addButton
        anchors.top: userBox.bottom
        anchors.topMargin: parent.height*.02
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.width*.1
        width: addText.paintedWidth + parent.width*.06
        radius: width*.04
        color: "black"
        border.color: "#8b988b"
        border.width: height*.03
        Text{
            id: addText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: parent.height*.55
            text: qsTr("Change User") + tr.emptyString
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.user = userInput.text
            }
        }
    }

    Rectangle{
        id: seperator2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: addButton.bottom
        anchors.topMargin: parent.height*.04
        color: "black"
        width: parent.width*.95
        height: parent.height*.003
    }
    Text{
        id: refresh
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: parent.width*.023
        anchors.top: seperator2.bottom
        anchors.topMargin: parent.height*.03
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
}
