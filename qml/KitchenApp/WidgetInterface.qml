import QtQuick 2.0

/***********************************************************************
 * DO NOT MODIFY THIS FILE IF YOU ARE JUST WORKING ON YOUR WIDGET!
 * INSTEAD, REDEFINE OR REIMPLEMENT STUFF IN YOUR OWN QML SUBCOMPONENT!
 ***********************************************************************/


Item {
    id: root
    width: parent.width

    property Item indicator


    // default height
    // you should readjust it if needed in your qml subcomponent
    height: 600

    Rectangle {
        anchors.fill: parent
        //color: "#007722"
        color: "transparent"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onPressed: {
            putIndication(mouseX, mouseY);
        }

        onPressAndHold: {
            app.ensureVisible();
            app.show();
            root.parent.destroy();
        }

        onReleased: {
            dropIndication();
        }

        onExited: {
            dropIndication();
        }

        onCanceled: {
            dropIndication();
        }

    }

    Component.onCompleted: {
        app.setWidgetRef(root);
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
    }

    function terminate() {
        root.parent.destroy();
    }

}


