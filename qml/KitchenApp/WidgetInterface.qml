import QtQuick 2.0

Item {
    id: root
    width: parent.width
    //width: 300
    // default height
    // you should readjust it if needed
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


