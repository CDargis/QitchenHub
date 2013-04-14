import QtQuick 2.0
import ".."

Item {
    id: root
    anchors.fill: parent;

    property int day: 0
    property int month: 0
    property int year: 0
    property Item parentItem

    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.9

        MouseArea {
            anchors.fill: parent
            onClicked: root.destroy();
        }
    }

    Rectangle {
        id: window
        anchors.centerIn: parent
        width: root.width * 0.5
        height: root.height * 0.5
        color: "#000000"
        border.color: "#36c60f"
        border.width: 1

        Column {
            width: window.width
            spacing: 2
            CommonText {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Events for") + " " + parentItem.monthFromNumber(month) + " " + day + ", " + year + tr.emptyString
            }

            Button {
                id: add
                anchors.horizontalCenter: parent.horizontalCenter
                width: window.width - 10
                buttonText: qsTr("New event");
                iconSource: "qrc:/images/plus.png"

                onButtonClick: {
                    var component = Qt.createComponent("AddEventMenu.qml");
                    var object = component.createObject(root, {"windowHeight": window.height * 1.3, "day": day, "month": month, "year": year, "parentItem": parentItem});
                }
            }
        }

    }

}
