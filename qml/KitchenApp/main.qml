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
<<<<<<< HEAD
    id:appRect
    //width: 1280
    //height: 768
=======

    MouseArea {
        anchors.fill: parent
        onClicked: {
           //Qt.quit();
      }
    }
>>>>>>> master


    // temporary placeholder defining the area containing buttons
    // and where apps are displayed
    AppGrid {
        id: appStack
        x: 0
        y: parent.height * 0.1


        /******************** static layer **************************/
        // if a button is meant to launch an app, make sure it behaves
        // like the template right below
        Button {
            id: button
            width: 125
            height: 125
            pointSize: 18
            buttonText: "App\nInterface\n(Temp)"


            MouseArea {
                anchors.fill: parent
                // make sure you put the name of your qml as an argument
                onClicked: launch("HomeAutomation.qml")
            }

        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
        }
        Button {
            width: 125
            height: 125
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
        currentScreenTitle: "Title of Current Screen"
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
