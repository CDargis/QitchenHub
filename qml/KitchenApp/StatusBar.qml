import QtQuick 2.0
import "Settings"

Rectangle {
    id: mainRect
    width: parent.width
    height: parent.height * .065
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    visible: true

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#7b7b85" }
        GradientStop { position: 1.0; color: "#26242a" }
    }

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
                            picBackground.color = "#CC666666"
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
            color: "#36c60f"
        }
        // Notification Rectangle
        Rectangle {
            id: notificationRect
            visible: false
            width: parent.width
            height: parent.height * 2.5
            anchors.top: userInfo.bottom
            color: picBackground.color
            border.width: 1
            border.color: "black"
            ListModel {
                id: notificationModel
            }
            ListView {
                id: notificationView
                anchors.fill: parent
                anchors.topMargin: 10
                width: parent.width; height: parent.height;
                verticalLayoutDirection: ListView.BottomToTop
                clip: true
                model: notificationModel
                delegate: NotificationItemDelegate {
                    notificationText: title + ": " + message;
                    functor: func
                    ListView.onAdd: picBackground.color = "#36C60F"
                }
            }
            onVisibleChanged: {
                //console.debug(notificationView.contentY);
                notificationView.currentIndex = notificationModel.count - 1
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
        /*Text {
            id: csText
            anchors.centerIn: parent
            font.family: fontFamily
            font.pointSize: 20
            text: currentScreenTitle
            color: "#36c60f"
        }*/

        Speaker {
            id: voice
            height: parent.height
            width: height * 3
            anchors.centerIn: parent
        }
    }

    // Settings Rectangle
    Rectangle {
        id: settingsTimeRect
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
            color: "#36c60f"
        }
        Image {
            id: settingsImg
            width: parent.height; height: parent.height; // make it a square like a sir
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/images/settingsTransparent.png"
            anchors.right: parent.right
            MouseArea {
                anchors.fill: parent
                onClicked: settingsBG.visible = !settingsBG.visible
            }
        }
    }

    // Settings rectangle
    Rectangle {
        id: settingsBG
        // Make it the size of the app
        width: parent.parent.width; height: parent.parent.height - mainRect.height
        anchors.top: mainRect.bottom
        visible: false
        color: "#CC000000"
        // Close button for settings
        Button {
            id: quitButton
            anchors.top: theSettings.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            width: 150
            height: 75
            buttonText: qsTr("Close") + tr.emptyString
        }
        // Rob the mouse everts from propogating through
        MouseArea {
            anchors.fill: parent
            onClicked: {
                settingsBG.visible = false
            }
        }
        Settings {
            id: theSettings
            width: parent.width * .65; height: parent.height * .65
            anchors.centerIn: parent
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

    function speakerRef() {
        return voice;
    }
}
