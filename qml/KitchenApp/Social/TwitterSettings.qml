import QtQuick 2.0

Rectangle{
    id: root
    visible: true
    color: "#36C60F"
    anchors.fill: parent
    border.color: "#8b988b"
    property string user: "Peters1Dan"
    ListView {
        id: userInfo
        width: parent.width
        height: parent.height*.33
        model: TwitterUserModel{}
        delegate: UserHeaderDelegate{}
    }
    Text{
        id: userLabel
        font.bold: true
        font.pixelSize: parent.height*.02
        anchors.top: userInfo.bottom
        anchors.topMargin: parent.height*.1
        anchors.left: parent.left
        anchors.leftMargin: parent.width*.025
        color: "black"
        font.family: "Sans"
        text: qsTr("User Name:") + tr.emptyString
    }
    Rectangle{
        id: userBox
        anchors.left: parent.left
        anchors.leftMargin: parent.width*.015
        anchors.top: userLabel.bottom
        anchors.topMargin: parent.height*.02
        height: parent.height*.06
        width: parent.width*.5
        color: "black"
        border.width: height*.03
        border.color: "#8b988b"
        TextInput{
            id: userInput
            anchors.left: parent.left
            anchors.leftMargin: parent.width*.01
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Sans"
            font.pixelSize: parent.height*0.5
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

    Text{
        id: passLabel
        font.bold: true
        font.pixelSize: parent.height*.025
        anchors.top: userBox.bottom
        anchors.topMargin: parent.height*.03
        anchors.left: parent.left
        anchors.leftMargin: parent.width*.015
        color: "black"
        font.family: "Sans"
        text: qsTr("Password:") + tr.emptyString
    }
    Rectangle{
        id: passBox
        anchors.left: parent.left
        anchors.leftMargin: parent.width*.015
        anchors.top: passLabel.bottom
        anchors.topMargin: parent.height*.02
        height: parent.height*.06
        width: parent.width*.5
        color: "black"
        border.width: height*.03
        border.color: "#8b988b"
        TextInput{
            id: passwordInput
            anchors.left: parent.left
            anchors.leftMargin: parent.width*.02
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Sans"
            font.pixelSize: parent.height*0.5
            maximumLength: 15
            color: "white"
            text: "**********"
            smooth:true
            echoMode: TextInput.Password
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                passwordInput.text = ""
                passwordInput.forceActiveFocus();
            }
        }
    }
    Rectangle{
        id: addButton
        anchors.top: userBox.bottom
        anchors.topMargin: parent.height*.02
        anchors.right: parent.right
        anchors.rightMargin: parent.width*.01
        height: parent.width*.13
        width: addText.paintedWidth + parent.width*.08
        radius: width*.04
        color: "black"
        border.color: "#8b988b"
        border.width: height*.03
        Text{
            id: addText
            anchors.centerIn: parent
            color: "white"
            font.family: "Sans"
            font.pixelSize: parent.height*.55
            text: qsTr("Sign in") + tr.emptyString
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
        anchors.top: passBox.bottom
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
    function setInteractive(inter){
        userInfo.interactive = inter
    }
}
