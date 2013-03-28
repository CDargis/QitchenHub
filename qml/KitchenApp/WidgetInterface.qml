import QtQuick 2.0

/***********************************************************************
 * DO NOT MODIFY THIS FILE IF YOU ARE JUST WORKING ON YOUR WIDGET!
 * INSTEAD, REDEFINE OR REIMPLEMENT STUFF IN YOUR OWN QML SUBCOMPONENT!
 ***********************************************************************/


Item {
    id: root
    width: parent.width


    // default height
    // you should readjust it if needed in your qml subcomponent
    height: 600

    Rectangle {
        anchors.fill: parent
        color: "#007722"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onPressAndHold: {
            app.show();
            root.parent.destroy();
        }

    }

    Component.onCompleted: {
        app.setWidgetRef(root);
    }

}


