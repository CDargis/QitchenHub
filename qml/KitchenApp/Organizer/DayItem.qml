import QtQuick 2.0

Rectangle {
    width: 100
    height: 62
    border.width: 1
    radius: 5
    smooth: true

    property int number: 0
    property int month: 0
    property int year: 0
    property string color1: "#000000"
    property string color2: "#000000"


    property var todayEvents
    property bool dealtWith: false

    gradient: Gradient {
        GradientStop { position: 0.0; color: color1 }
        GradientStop { position: 1.0; color: color2 }
    }

    Rectangle {
        id: marker
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        width: parent.width * 0.3
        height: parent.height * 0.1
        color: "#36c60f"
        opacity: 0
    }

    Text  {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        font.pixelSize: 25
        color: "#36c60f"
        style: Text.Outline
        styleColor: "#3f503a"
        text: number
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("pressed");
            organizer.showEvents(number, month, year, todayEvents);
        }
    }

    function clearEvents() {
        todayEvents = undefined;
        marker.opacity = 0;
    }

    function addEvent(event) {

        if (todayEvents == null)
            todayEvents = new Array;

        todayEvents[todayEvents.length] = event;

        marker.opacity = 1;
    }
}
