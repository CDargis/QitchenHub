import QtQuick 2.0
import TTSVoice 1.0

Rectangle {

    Component.onCompleted: {
        var func1 = "function doIt() {console.log('hey from first notification')}"
        var func2 = "function doIt() {console.log('hey from second notification')}"
        statusBar.addNotification({"title": "Notification 1", "message": "something happening", "func": func1})
        statusBar.addNotification({"title": "Notification 2", "message": "hi there!", "func": func2})
        speaker.say("Welcome! how can i serve you?")
    }
    // Define globals here ... at least for now
    property string fontFamily: "Sans";

    // apps are parented to this item so they are able to use anchors
    Item {
        id: desktop
        x: 0
        y: parent.height * 0.1
        width: parent.width * 0.85
        height: parent.height - desktop.y;

        Voice {
            id: speaker
        }

        // placeholder defining the area containing buttons
        AppGrid {
            id: appgrid

            /******************** static layer **************************/
            // if a button is meant to launch an app, make sure it behaves
            // like the template right below
            // also each button has to explicitly state it's size
            // and it better be that all buttons have the same size
            Button {
                id: button
                width: 150
                height: 125
                pointSize: 18
                buttonText: "Home Automation"


                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    onClicked: {
                        speaker.say("app open");
                        launch("HomeAutomation.qml");
                    }
                }

            }
            Indicator {

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
            var app = component.createObject(desktop);

            // register an app with the dock
            app.callWidget.connect(dock.createWidget);
        }
        else console.log(component.errorString());
    }
}
