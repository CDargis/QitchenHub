import QtQuick 2.0

Rectangle {

    Component.onCompleted: {
        var func1 = "function doIt() {console.log('hey from first notification')}"
        var func2 = "function doIt() {console.log('hey from second notification')}"
        statusBar.setCurrentScreenTitle("Qitchen Hub")
        statusBar.addNotification({"title": "Notification 1", "message": "something happening", "func": func1})
        statusBar.addNotification({"title": "Notification 2", "message": "hi there!", "func": func2})
    }
    // Define globals here ... at least for now
    property string fontFamily: "Sans";

    // temporary placeholder defining the area containing buttons
    // and where apps are displayed
    Rectangle {
        id: appStack
        anchors.top: statusBar.bottom
        width: parent.width * 0.85
        height: parent.height - appStack.y;
        border.color: "#000000"
        z: 0


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
                onClicked: launch("HomeAutomation.qml")
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
    StatusBar {
        id: statusBar
        usrName: "Chris"
        usrPicSource: "qrc:/images/user.png"
        currentScreenTitle: "QitchenHub"
    }

    //************* launch an app ******************/
    // qmlComp - name (string) of local qml component to launch (i.e. myapp.qml)
    function launch(qmlComp)
    {
        var component = Qt.createComponent(qmlComp);
        if(component.status === Component.Ready) {
            var app = component.createObject(appStack);

            // register an app with the dock
            app.callWidget.connect(dock.createWidget);
        }
        else console.log(component.errorString());
    }
}
