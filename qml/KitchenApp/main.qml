import QtQuick 2.0

Rectangle {

    Component.onCompleted: {
        var func1 = "function doIt() {console.log('hey from first notification')}"
        var func2 = "function doIt() {console.log('hey from second notification')}"
        statusBar.addNotification({"title": "Notification 1", "message": "something happening", "func": func1})
        statusBar.addNotification({"title": "Notification 2", "message": "hi there!", "func": func2})
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
