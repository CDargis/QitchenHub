import QtQuick 2.0

Rectangle {

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
    StatusBar {
        id: statusBar
        usrName: "Chris"
        usrPicSource: "qrc:/images/tentacle.jpeg"
        currentScreenTitle: "Title of Current Screen"
    }

    Rectangle {
        id: appStack
        x: 0
        y: parent.height * 0.1
        width: parent.width * 0.85
        height: parent.height - appStack.y;
        border.color: "#000000"

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

    Dock {
        id: dock
        x: parent.width * 0.85
        y: parent.height * 0.1
        width: parent.width - dock.x
        height: parent.height - dock.y

    }

    function launch(qmlComp)
    {
        var component = Qt.createComponent(qmlComp);
        var app = component.createObject(appStack);

        app.callWidget.connect(dock.createWidget);
    }



}
