import QtQuick 2.0

Rectangle {

    // Define globals here ... at least for now
    property string fontFamily: "Sans";
 id:appRect
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


    // temporary placeholder defining the area containing buttons
    // and where apps are displayed
    Rectangle {
        id: appStack
        x: 0
        y: parent.height * 0.1
        width: parent.width * 0.85
        height: parent.height - appStack.y;
        border.color: "#000000"


        /******************** static layer **************************/
        // if a button is meant to launch an app, make sure it behaves
        // like the template right below
        Button {
            id: button
            anchors.centerIn: parent
            width: 125
            height: 125
            pointSize: 18
            buttonText: "button!!"


            MouseArea {
                anchors.fill: parent
                // make sure you put the name of your qml as an argument
                onClicked: launch("AppInterface.qml")
            }
        }

        /************* dynamic layer *************************/
        // just an abstract placeholder but as a matter of fact
        // all apps end up right here


    }

    Dock {
        id: dock
        x: parent.width * 0.85
        y: parent.height * 0.1
        width: parent.width - dock.x
        height: parent.height - dock.y

    }

    //************* launch an app ******************/
    // qmlComp - name (string) of local qml component to launch (i.e. myapp.qml)
    function launch(qmlComp)
    {
        var component = Qt.createComponent(qmlComp);
        var app = component.createObject(appStack);

        // register an app with the dock
        app.callWidget.connect(dock.createWidget);
    }

}
