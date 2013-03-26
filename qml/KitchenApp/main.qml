import QtQuick 2.0

Rectangle {

    Component.onCompleted: {
        statusBar.addNotification({"title": "Notification 1", "message": "something happening"})
        statusBar.addNotification({"title": "Notification 2", "message": "hi there!"})
        statusBar.addNotification({"title": "Notification 3", "message": "hey man"})
    }
    // Define globals here ... at least for now
    property string fontFamily: "Sans";

    //width: 1280
    //height: 768

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Rectangle {
        id: appStack
        x: 0
        y: parent.height * 0.1
        width: parent.width * 0.85
        height: parent.height - appStack.y;
        border.color: "#000000"
        z: 0

        /******************** static layer **************************/
        Button {
            id: button
            anchors.centerIn: parent
            width: 125
            height: 125
            pointSize: 18
            buttonText: "button!!"


            MouseArea {
                anchors.fill: parent
                onClicked: launch("AppInterface.qml")
            }
        }

        /************* dynamic layer *************************/


    }

    DropArea {
        id: dock
        x: parent.width * 0.85
        y: parent.height * 0.1
        width: parent.width - dock.x
        height: parent.height - dock.y

        onEntered: {
            console.debug("entered drop area");
        }
    }

    function launch(qmlComp)
    {
        var component = Qt.createComponent(qmlComp);
        component.createObject(appStack);
    }

    StatusBar {
        id: statusBar
        usrName: "Chris"
        usrPicSource: "qrc:/images/user.png"
        currentScreenTitle: "Title of Current Screen"
    }
}
