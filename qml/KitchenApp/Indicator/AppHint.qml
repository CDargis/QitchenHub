import QtQuick 2.0

Item {
    id: root
    width: 300
    height: 100

    Row {

        anchors.fill: parent

        Image {
            width: parent.width / 2
            height: root.height
            source: "qrc:/images/arrowl.png"

            Text {
                anchors.centerIn: parent
                text: qsTr("Quit");
            }
        }

        Image {
            width: parent.width / 2
            source: "qrc:/images/arrowr.png"
            height: root.height
            Text {
                anchors.centerIn: parent
                text: qsTr("Dock");
            }
        }
    }
}
