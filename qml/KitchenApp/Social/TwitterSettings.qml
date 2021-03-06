<<<<<<< HEAD
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
        height: parent.height*.05
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
        height: parent.height*.05
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
=======
import QtQuick 2.0
import "../"

Rectangle{
    id: root
    visible: true
    color: "#36C60F"
    anchors.fill: parent
    border.color: "#8b988b"
    property string user: "Peters1Dan"
    property string sign: qsTr("Sign out")
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
            font.pixelSize: parent.height*.5
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
    }
    function getStatus(){
        return addText.text
    }

    function checkUser(){
        if (addText.text == "Sign out" || addText.text == "Wyloguj"){
            root.user = ""
            userInput.currentText = ""
            speaker.say("Signing out");
        }
        else{
            root.user = userInput.currentText
            speaker.say("Signing in");
        }
    }



    states: [
        State {
            name: "expanded"
            PropertyChanges {
                target: addText
                text: theMainApplication.language == "en" ? sign : "Wyloguj"
            }
            when: root.user != ""
        }
    ]
}
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
