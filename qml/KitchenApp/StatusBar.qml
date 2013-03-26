import QtQuick 2.0
import QtQuick.XmlListModel 2.0

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
        Rectangle {
            id: picBackground
            color: "transparent"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height; height: parent.height
            Image {
                id: pic
                anchors.left: parent.left
                anchors.centerIn: parent
                width: (parent.height * .85); height: (parent.height * .85)  // Make it a square
                source: usrPicSource
                // Mouse area clicking to display notifications. If user clicks icon, toggle notification area
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        if(notificationRect.visible === false) {
                            notificationRect.visible = true
                            picBackground.color = "#CC777777"
                        }
                        else {
                            notificationRect.visible = false
                            picBackground.color = "transparent"
                        }
                    }
                }
            }
        }
        Text {
            id: name
            anchors.verticalCenter: picBackground.verticalCenter
            anchors.left: picBackground.right
            anchors.leftMargin: 20
            font.family: fontFamily
            font.pointSize: 14
            text: usrName
        }
        // Notification Rectangle
        Rectangle {
            id: notificationRect
            visible: false
            width: parent.width
            height: parent.height * 2
            anchors.top: userInfo.bottom
            color: picBackground.color
            border.width: 1
            border.color: "black"
            Flickable {
                anchors.fill: parent
                clip: true
                flickableDirection: Flickable.VerticalFlick
                ListModel {
                    id: notificationModel
                }
                ListView {
                    id: notificationView
                    anchors.fill: parent
                    width: parent.width; height: parent.height
                    verticalLayoutDirection: ListView.BottomToTop
                    model: notificationModel
                    spacing: 5
                    delegate: NotificationItemDelegate {
                        notificationText: title + ": " + message;
                        bold: true
                        ListView.onAdd: picBackground.color = "orange"
                    }
                }
            }
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

    function addNotification(jsonNotification) {
        notificationModel.append(jsonNotification)
    }

    function setUserInfo(name, picSource) {
        usrName = name;
        usrPicSource = picSource;
    }
    function setCurrentScreenTitle(title) {
        currentScreenTitle = title;
    }
}
