import QtQuick 2.0

Rectangle {
    // Define globals here ... at least for now
    property string fontFamily: "Sans";

    Component.onCompleted: {
        statusBar.setUserInfo("Chris", "qrc:/images/tentacle.jpeg");
        statusBar.setCurrentScreenTitle("Title of Current Screen");
    }
    width: 1280
    height: 768
    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
    StatusBar { id: statusBar; }
}
