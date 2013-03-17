import QtQuick 2.0

Rectangle {

    // Define globals here ... at least for now
    property string fontFamily: "Sans";

    width: 1280
    height: 768
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
    StatusBar {
        id: statusBar
        usrName: "Chris"
        usrPicSource: "qrc:/images/tentacle.jpeg"
        currentScreenTitle: "Title of Current Screen"
    }
    Button {
        id: button
        anchors.centerIn: parent
        width: 125
        height: 125
        pointSize: 18
        buttonText: "button!!"
    }
}
