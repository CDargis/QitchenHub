import QtQuick 2.0
import "../"

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

    Rectangle{
        id: seperator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: userInfo.bottom
        anchors.topMargin: parent.height*.09
        color: "black"
        width: parent.width*.95
        height: parent.height*.003
    }

    Text{
        id: userLabel
        font.bold: true
        font.pixelSize: parent.height*.025
        anchors.top: seperator.bottom
        anchors.topMargin: parent.height*.02
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"
        font.family: "Sans"
        text: qsTr("User Name:") + tr.emptyString
    }
    VirtualInput{
        id: userInput
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: userLabel.bottom
        anchors.topMargin: parent.height*.02
        height: parent.height*.05
        width: parent.width*.5
        color: "black"
        fontColor: "white"
        border.width: height*.03
        border.color: "#8b988b"
        fontSize: height*0.5
        currentText: user
        onKeyboardIsVisible: {
            if(currentText === user)
                currentText = ""
        }
    }

    Text{
        id: passLabel
        font.bold: true
        font.pixelSize: parent.height*.025
        anchors.top: userInput.bottom
        anchors.topMargin: parent.height*.02
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"
        font.family: "Sans"
        text: qsTr("Password:") + tr.emptyString
    }
    VirtualInput{
        id: passwordInput
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: passLabel.bottom
        anchors.topMargin: parent.height*.02
        height: parent.height*.05
        width: parent.width*.5
        fontColor: "white"
        border.width: height*.03
        color: "black"
        isPassword: true
        border.color: "#8b988b"
        fontSize: height*0.5
        //echoMode: TextInput.Password
    }
    Rectangle{
        id: signin
        anchors.top: passwordInput.bottom
        anchors.topMargin: parent.height*.02
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.width*.13
        width: addText.paintedWidth + parent.width*.08
        radius: width*.06
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
                checkUser()
                passwordInput.currentText = ""

            }
        }
    }

    Rectangle{
        id: seperator2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signin.bottom
        anchors.topMargin: parent.height*.02
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
    function setUser(){
        root.user = "Peters1Dan"
        console.log(root.user)
    }
    function getStatus(){
        return addText.text
    }

    function checkUser(){
        if (addText.text == "Sign out"){
            root.user = ""
            userInput.currentText = ""
        }
        else{
            root.user = userInput.currentText
        }
    }



    states: [
        State {
            name: "expanded"
            PropertyChanges {
                target: addText
                text: "Sign out"
            }
            when: root.user != ""
        }
    ]
}
