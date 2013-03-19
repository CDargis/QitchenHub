import QtQuick 2.0
Flickable {
    id: root
    anchors.fill: parent
    //Drag.active: dragArea.drag.active
    flickableDirection: Flickable.HorizontalFlick
    //interactive: false

    property string widgetSrc: "WidgetInterface.qml"
    property bool moving: false
    property variant state

    function initialize()
    {
        state.prop1 = 0;
        state.prop2 = 1;
        state.prop3 = 2;
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        //drag.target: parent
        drag.axis: Drag.XAxis
        onPressAndHold: {
            //root.interactive = true;
        }

        onReleased: {
            //root.interactive = false;
        }
    }

    onFlickStarted: {
        console.debug("flickstarted");
    }

    onFlickEnded: {
        console.debug("flickended");
    }

    onMovementStarted: {
        console.debug("movestarted");
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

    Component.onCompleted: initialize()
}
