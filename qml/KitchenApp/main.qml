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
                onClicked: launch("AppInterface.qml", "AppInterface")
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


    function launch(qmlComp, appID)
    {
        var component = Qt.createComponent(qmlComp);
        var app = component.createObject(appStack);

        // register an app with the dock
        app.callWidget.connect(dock.createWidget);

        // set additional properties
        app.appID = appID;
    }

    Rectangle{
        id:app1
        opacity:0
        x:300
        y:300

        width:50
        height:50
        color: "steel blue"

    }

Rectangle{

    x:300
    y:300
    Text {
        id: name
        text: "app"
    }
    width:50
    height:50
    color: "steel blue"
     border.color: "steel blue"
MouseArea{
anchors.fill: parent

onClicked: {
    {if(appRect.state == "")
                    {appRect.state = "open";
                      }}
}
}
}

    states: [
        State {
            name: "open"
            PropertyChanges {
                target: app1
                opacity:1
                width:appStack.width
                height:appStack.height
                x:appStack.x
                y:appStack.y
            }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "open"
            NumberAnimation{properties: "opacity,width,height,x,y"}
        }
    ]


}
