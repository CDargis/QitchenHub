import QtQuick 2.0
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
        //drag.target: parent
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

    // called automatically when a widget is instantiated
    function setWidgetRef(newWidget) {
        widget = newWidget;
    }

    function test() {
        console.debug("App here!");
    }
}
