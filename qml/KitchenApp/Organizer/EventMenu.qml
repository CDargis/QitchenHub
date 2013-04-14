import QtQuick 2.0

Item {
    id: root
    anchors.fill: parent;
    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.5
    }

    Rectangle {
        anchors.centerIn: parent
        width: root.width * 0.5
        height: root.height * 0.5
        color: "#000000"
    }
}
