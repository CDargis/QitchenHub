import QtQuick 2.0
import ".."

WidgetInterface {
    id: root
    height: 300

    property int day: 99
    property string dayString: "Monday"

    Rectangle {
        radius: 5
        anchors.fill: parent
        border.width: 1
        border.color: "#000000"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#222222" }
            GradientStop { position: 1.0; color: "#444444" }
        }
    }

    Image {
        id: icon
        width: parent.width * 0.2
        height: width
        anchors.top: parent.top
        anchors.topMargin: -5
        anchors.left: parent.left
        anchors.leftMargin: 5
        source: "qrc:/images/calendar-icon.png"

        CommonText {
            anchors.centerIn: parent
            text: day
        }
    }

    CommonText {
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        text: dayString
    }

    Flickable {
        id: eventView
        anchors.top: icon.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: root.horizontalCenter
        width: root.width;
        height: root.height - icon.height - 5;
        flickableDirection: Flickable.VerticalFlick
        clip: true
        contentHeight: eventsContainer.height

        Column {
            id: eventsContainer
            spacing: 2
        }
    }

    Component.onCompleted: {

        var odate = app.oDate;

        day = odate.day;
        dayString = app.dayFromNumber(odate.dayOfWeek(odate.day, odate.month, odate.year));

        showUpcoming();
    }

    function showUpcoming() {

        var jsonDate = app.requestUpcoming();

        for (var i = 0; i < jsonDate.length; ++i) {

            var component = Qt.createComponent("WidgetEventDelegate.qml");
            var object = component.createObject(eventsContainer);

            object.width = root.width
            object.day = jsonDate[i].day;
            object.month = jsonDate[i].month;
            object.title = jsonDate[i].title;

            if (i % 2 == 0)
                object.bgColor = "#111111";
            else
                object.bgColor = "#555555";
        }
    }
}
