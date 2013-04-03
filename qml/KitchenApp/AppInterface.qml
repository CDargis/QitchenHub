import QtQuick 2.0


/***********************************************************************
 * DO NOT MODIFY THIS FILE IF YOU ARE JUST WORKING ON YOUR APP!
 * INSTEAD, REDEFINE OR REIMPLEMENT STUFF IN YOUR OWN QML SUBCOMPONENT!
 ***********************************************************************/


Flickable {
    id: root
    anchors.fill: parent
    opacity: 1.0

    flickableDirection: Flickable.HorizontalFlick
    interactive: false
    flickDeceleration: 20

    signal callWidget(string source, Item app)

    // set this to your widget component qml file
    property string widgetSrc: "WidgetInterface.qml"

    // this holds a reference to a widget if one exists
    // it is set automatically for you
    property Item widget


    property bool moving: false
    property variant state

    MouseArea {
        id: dragArea
        anchors.fill: parent
        propagateComposedEvents: true
        drag.axis: Drag.XAxis
        onPressAndHold: {
            root.interactive = true;
        }

        onReleased: {
            root.interactive = false;
        }
    }

    onFlickStarted: {
        console.debug("flickstarted");
    }

    onFlickEnded: {
        console.debug("flickended");
        callWidget(widgetSrc, root);
        console.debug(root.state);
        root.state = "HIDDEN";

        console.debug(root.state);
        console.debug(root.opacity);
        root.interactive = false;
    }

    onMovementStarted: {
        console.debug("movestarted");
        console.debug(root.flickDeceleration);
        moving = true;
    }

    onMovementEnded: {
        console.debug("moveended");
    }

    boundsBehavior: Flickable.DragOverBounds




    Rectangle {
        color: "#002277"
        anchors.fill: parent
        z: 0

        Image {
            id: backArrow
            source: "qrc:/images/backArrow.png"
            anchors.left: parent.left
            anchors.leftMargin: parent.height*0.01
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.01
            signal clicked
            width: parent.width*.05
            height: parent.width*.05
            smooth: true
            MouseArea {
              anchors.fill: parent
              onClicked: hide()
            }
        }

        Image {
            id: terminate
            source: "qrc:/images/delete.png"
            anchors.right: parent.right
            anchors.rightMargin: parent.height*0.01
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.01
            signal clicked
            width: parent.width*.05
            height: parent.width*.05
            smooth: true
            MouseArea {
              anchors.fill: parent
              onClicked: root.destroy()
            }
        }
    }

    states: [
        State {
            name: "HIDDEN"
            when: root.state == "HIDDEN"
            PropertyChanges {
                target: root
                opacity: 0.0
                enabled: false
            }
        }
    ]

    transitions: [
        Transition {
            from: "HIDDEN"
            to: ""
            NumberAnimation {
                target: root
                property: "opacity"
                duration: 500
                easing.type: Easing.InOutQuad
            }

        },
        Transition {
            from: ""
            to: "HIDDEN"
            NumberAnimation {
                target: root
                property: "opacity"
                duration: 500
                easing.type: Easing.InOutQuad
            }

        }
    ]

    function show() {
        root.state = "";
    }

    function hide() {
        root.state = "HIDDEN";
    }

    // called automatically when a widget is instantiated
    function setWidgetRef(newWidget) {
        widget = newWidget;
    }

    function test() {
        console.debug("App here!");
    }
}
