import QtQuick 2.0
import ".."

WidgetInterface {
    id: root
    height: 200
    Rectangle {
        radius: 5
        anchors.fill: parent
        border.width: 1
        border.color: "#000000"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#222222" }
            GradientStop { position: 1.0; color: "#444444" }
        }
    }
    Image {
        id: icon
        width: parent.width*.75
        height: parent.width*.75
        anchors.centerIn: parent
        source: "qrc:/images/socialwidget.png"
    }

    Rectangle{
        id: fb
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.width*.13
        width: signFB.paintedWidth + parent.width*.08
        radius: width*.06
        color: "black"
        border.color: "#8b988b"
        border.width: height*.03
        Text{
            id: signFB
            anchors.centerIn: parent
            color: "white"
            font.family: "Sans"
            font.pixelSize: parent.height*.55
            text: qsTr("Sign out") + tr.emptyString
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                checkUser1(signFB)
            }
        }
    }
    Rectangle{
        id: tw
        anchors.top: parent.top
        anchors.right: parent.right
        height: parent.width*.13
        width: signTW.paintedWidth + parent.width*.08
        radius: width*.06
        color: "black"
        border.color: "#8b988b"
        border.width: height*.03
        Text{
            id: signTW
            anchors.centerIn: parent
            color: "white"
            font.family: "Sans"
            font.pixelSize: parent.height*.55
            text: app.twUser3()
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                checkUser(signTW)
            }
        }
    }
    Rectangle{
        id: gp
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        height: parent.width*.13
        width: signGP.paintedWidth + parent.width*.08
        radius: width*.06
        color: "black"
        border.color: "#8b988b"
        border.width: height*.03
        Text{
            id: signGP
            anchors.centerIn: parent
            color: "white"
            font.family: "Sans"
            font.pixelSize: parent.height*.55
            text: qsTr("Sign out") + tr.emptyString
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                checkUser1(signGP)
            }
        }
    }
    Rectangle{
        id: rss
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: parent.width*.13
        width: signRSS.paintedWidth + parent.width*.08
        radius: width*.06
        color: "black"
        border.color: "#8b988b"
        border.width: height*.03
        Text{
            id: signRSS
            anchors.centerIn: parent
            color: "white"
            font.family: "Sans"
            font.pixelSize: parent.height*.55
            text: app.count() + " of feeds"
        }
    }
    function checkUser(txt){
        if (txt.text == "Sign out"){
            txt.text = qsTr("Sign in")
            app.twUser()
        }
        else if(txt.text == "Sign in"){
            txt.text = qsTr("Sign out")
            app.twUser2();
        }
    }
    function checkUser1(txt){
        if (txt.text == "Sign out"){
            txt.text = qsTr("Sign in")
        }
        else if(txt.text == "Sign in"){
            txt.text = qsTr("Sign out")
        }
    }
}
