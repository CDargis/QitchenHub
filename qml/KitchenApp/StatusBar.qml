import QtQuick 2.0

Rectangle {
    id: statusBar

    width: parent.width
    height: parent.height * .1    // Only take up 10% of space
    color: "#44AAAA"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    visible: true

    // User info rect
    Rectangle {
        id: userInfo
        width: parent.width / 3  // 3 Sections of statusbar
        height: parent.height
        color: "transparent"
        Image {
            id: userPic
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: parent.height - (parent.height * .85)
            width: (parent.height * .85); height: (parent.height * .85)  // Make it a square
        }
        Text {
            id: userName
            anchors.verticalCenter: userPic.verticalCenter
            anchors.left: userPic.right
            anchors.leftMargin: 20
            font.family: fontFamily
            font.pointSize: 14
        }
    }

    // Current Screen rect
    Rectangle {
        id: currentScreen
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        anchors.left: userInfo.right
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: currentScreenText
            anchors.centerIn: parent
            font.family: fontFamily
            font.pointSize: 20
        }
    }

    // Settings Rectangle
    Rectangle {
        id: settingsRect
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        anchors.left: currentScreen.right
        anchors.verticalCenter: parent.verticalCenter
        Image {
            id: settingsImg
            width: parent.height; height: parent.height; // make it a square like a sir
            source: "qrc:/images/settingsTransparent.png"
            anchors.right: parent.right
        }
    }

    // Function definitions------------------------------------------------

    function setUserInfo(name, picSource) {
        userName.text = name;
        userPic.source = picSource;
    }
    function setCurrentScreenTitle(title) {
        currentScreenText.text = title;
    }
}
