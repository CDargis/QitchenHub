import QtQuick 2.0
import "Indicator"


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
    property int appIndex

    signal languageChange(string lang) // Changing the language, dude
    signal changeUnits(string units) // Changing the units, man
    signal callWidget(string source, Item app)

    // set this to your widget component qml file
    property string widgetSrc: "WidgetInterface.qml"

    // this holds a reference to a widget if one exists
    // it is set automatically for you
    property Item widget


    property bool moving: false
    property variant state

    // consider these to be hidden
    // for interior use only
    property Item indicator
    property Item hint


    MouseArea {
        id: dragArea
        anchors.fill: parent
        //propagateComposedEvents: true
        drag.axis: Drag.XAxis

        onPressed: {
            putIndication(mouseX, mouseY);
        }

        onPressAndHold: {
            root.interactive = true;
            putHint(mouseX, mouseY);
        }

        onReleased: {
            root.interactive = false;
            dropIndication();
        }
    }

    onFlickStarted: {
        dropIndication();
    }

    onFlickEnded: {
    }

    onMovementStarted: {
        moving = true;
        dropIndication();
    }

    onMovementEnded: {
    }

    onDragEnded: {
        // if flickable move more than 100px to the right
        if (root.contentX < -100 && root.widget == null) {
            callWidget(widgetSrc, root);
            speaker.say("App Docked");
            root.state = "HIDDEN";
            root.interactive = false;
        }
        // else more than 100px to the left
        else if (root.contentX > 100)
        {
            appgrid.terminateIndex(root.appIndex);
            root.destroy();
        }
    }

    boundsBehavior: Flickable.DragOverBounds

    Rectangle {
        anchors.fill: parent
        z: 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#7C7C85" }
            GradientStop { position: 1.0; color: "#25242A" }
        }
    }

    Image {
        id: homeButton
        z: 99
        source: "qrc:/images/home.png"
        anchors.left: parent.left
        anchors.leftMargin: parent.height*0.01
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.01
        signal clicked
        height: 40
        width: 60
        smooth: true
        MouseArea {
          anchors.fill: parent
          onClicked: hide()
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

    /*
    Component.onCompleted: {
        setIndex();
    }
    */

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

    function putIndication(x, y) {
        var component = Qt.createComponent("Indicator/Indicator.qml");
        indicator = component.createObject(root);
        indicator.x = x - indicator.width * 0.5;
        indicator.y = y - indicator.height * 0.5;
    }

    function dropIndication() {
        if (indicator != null)
            indicator.destroy();
        if (hint != null)
            hint.destroy();
    }

    function putHint(x, y) {
        var component = Qt.createComponent("Indicator/AppHint.qml");
        hint = component.createObject(root);

        hint.x = x - hint.width * 0.5;
        if (y < 60)
            hint.y = y + hint.height * 0.5;
        else
            hint.y = y - hint.height;
    }

    function hideBackButton(){
        homeButton.visible = false;
    }
}
