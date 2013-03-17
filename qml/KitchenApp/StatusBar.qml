import QtQuick 2.0

Rectangle {
    id: mainRect
    width: parent.width
    height: parent.height * .1    // Only take up 10% of space
    color: "#44AAAA"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    visible: true

    property string usrName: ""
    property string usrPicSource: ""
    property string currentScreenTitle: ""

    // User info rect
    Rectangle {
        id: userInfo
        width: parent.width / 3  // 3 Sections of statusbar
        height: parent.height
        color: "transparent"
        Image {
            id: pic
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: parent.height - (parent.height * .85)
            width: (parent.height * .85); height: (parent.height * .85)  // Make it a square
            source: usrPicSource
        }
        Text {
            id: name
            anchors.verticalCenter: pic.verticalCenter
            anchors.left: pic.right
            anchors.leftMargin: 20
            font.family: fontFamily
            font.pointSize: 14
            text: usrName
        }
    }

    // Current Screen rect
    Rectangle {
        id: currentScreenRect
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        anchors.left: userInfo.right
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: csText
            anchors.centerIn: parent
            font.family: fontFamily
            font.pointSize: 20
            text: currentScreenTitle
        }
    }

    // Settings Rectangle
    Rectangle {
        id: settingsRect
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        anchors.left: currentScreenRect.right
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
        usrName = name;
        usrPicSource = picSource;
    }
    function setCurrentScreenTitle(title) {
        currentScreenTitle = title;
    }
}
