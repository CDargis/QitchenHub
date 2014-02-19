import QtQuick 2.0
import ".."

Item {
    id: root
    anchors.fill: parent;

    property int day: 0
    property int month: 0
    property int year: 0
    property Item parentItem

    property var eventData

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

        MouseArea {
            anchors.fill: parent
        }

        Column {
            id: header
            width: window.width
            spacing: 2
            CommonText {
                id: title
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
                    var object = component.createObject(root, {"windowHeight": window.height * 1.3, "day": day, "month": month, "year": year, "organizer": parentItem});
                }
            }
        }

        Flickable {
            id: eventView
            anchors.top: header.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: window.horizontalCenter
            width: window.width - 20;
            height: window.height - header.height - 15;
            flickableDirection: Flickable.VerticalFlick
            clip: true
            contentHeight: viewPositioner.height

            Column {
                id: viewPositioner
                width: eventView.width
                spacing: 5

                onChildrenChanged: {
                    console.log(viewPositioner.children.length);
                }
            }
        }
    }

    Component.onCompleted: {
        speaker.say(title.text.toString());
    }

    function showEvents() {

        if (eventData == null)
            return;

        for (var i = 0; i < eventData.length; ++i) {
            showSingleEvent(eventData[i]);
        }
    }

    function showSingleEvent(event) {

        var component = Qt.createComponent("EventDelegate.qml");
        var object = component.createObject(viewPositioner);

        object.time = event.hour + ":" + event.minute;
        object.desc = qsTr("Title") + ": " + event.title + "\n" +
                qsTr("Location") + ": " + event.location + "\n" +
                qsTr("Description") + ": " + event.description + tr.emptyString;

    }

    function addEventToList(jsonDate) {

        if (eventData == null)
            eventData = new Array;

        eventData[eventData.length] = jsonDate

        showSingleEvent(eventData[eventData.length - 1]);
    }

}
