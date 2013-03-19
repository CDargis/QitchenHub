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

    // Timer for refreshing da clock!
    Item {
        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: {
                var today = new Date();
                date.text = Qt.formatDateTime(today, "MMMM dd, yyyy");
             }
        }
    }

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
        Text {
            id: date
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: settingsImg.left
            anchors.rightMargin: 20
            font.family: fontFamily
            font.pointSize: 14
        }
        Image {
            id: settingsImg
            width: parent.height; height: parent.height; // make it a square like a sir
            anchors.verticalCenter: parent.verticalCenter
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
