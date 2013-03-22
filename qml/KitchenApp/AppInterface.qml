import QtQuick 2.0
Flickable {
    id: root
    anchors.fill: parent
    opacity: 1.0

    flickableDirection: Flickable.HorizontalFlick
    interactive: false
    flickDeceleration: 20

    signal callWidget(string source)

    // set this to your widget compnent qml file
    property string widgetSrc: "WidgetInterface.qml"
    property string appID: "AppInterface"


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
        callWidget(widgetSrc);
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
}
