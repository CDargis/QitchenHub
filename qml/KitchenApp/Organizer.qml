import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "Organizer"

AppInterface {
    id: root
    anchors.fill: parent
    property string title: "23"

    property date data
    property string currentMonth
    property string currentYear

    // for interior use only
    property real contentYCache
    property int pos: 0;

    onLanguageChange: {
        statusBar.currentScreenTitle = qsTr("Organizer") + tr.emptyString
    }

    Rectangle {
        anchors.fill: parent
        width: parent.width; height: parent.height
        z: 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#333333" }
            GradientStop { position: 1.0; color: "#111111" }
        }
    }

    Item {
        width: root.width
        height: root.height * 0.1

        Text  {
            anchors.centerIn: parent
            font.pixelSize: 25
            color: "#36c60f"
            style: Text.Outline
            styleColor: "#3f503a"
            text: qsTr(currentMonth) + tr.emptyString + " " + currentYear;
        }
    }

    ListView {
        id: list
        width: root.width
        height: root.height * 0.9
        y: root.height * 0.1
        snapMode: ListView.SnapOneItem
        clip: true
        cacheBuffer: list.height / 2;
        pressDelay: 500
        //anchors.fill: parent
        model: model
        delegate: MonthItem {
            width: list.width
            height: list.height
        }

        onDragStarted: {
            contentYCache = contentY;
        }


        onDragEnded: {
            /*var currentIndex = list.currentIndex;
            var lastIndex = list.count - 1;

            console.debug("current Index: " + currentIndex + " lastIndex: " + lastIndex);

            var current = list.i;*/

            console.log("currentPos " + pos);
            console.log("coontentY: " + list.contentY + " cached: " + contentYCache);
            // if up
            if (list.contentY < contentYCache) {
                --pos;

                if (pos <= 2) {

                    var first = model.get(0);
                    var month = first.month;
                    var year = first.year;

                    if (month === 1)
                        prependMonth(0, 12, year - 1);
                    else
                        prependMonth(0, month - 1, year);

                    ++pos;
                }
            }
            else {
                ++pos;

                if (pos >= list.count - 2) {

                    var last = model.get(model.count - 1);
                    var month = last.month;
                    var year = last.year;

                    if (month == 12)
                        appendMonth(0, 1, year + 1);
                    else
                        appendMonth(0, month + 1, year);
                }

            }

            var dMonth = model.get(pos).month;
            var dYear = model.get(pos).year;
            setDisplayDate(dMonth, dYear);
        }

        onCurrentIndexChanged: {
            console.log("currentIndex: " + list.currentIndex + " itemsTotal: " + list.count);
        }

    }

    ListModel {
        id: model

        onCountChanged: {
            console.log("************  " + model.count + "  ********************");
            for (var i = 0; i < model.count; ++i) {
                console.log("position: " + i + " month: " + model.get(i).month + " year: " + model.get(i).year);
            }
            console.log("************ END ********************");
        }
    }



    Component.onCompleted: {
        languageChange(theMainApplication.language)  // Set the language
        speaker.say(qsTr("Organizer"));

        console.log(root.width);
        //populate(new Date());

        var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        currentMonth = monthFromNumber(month);
        currentYear = year;

        console.debug("today: " + day + " " + month + " " + year);

        if (month == 1)  {
            appendMonth(0, 11, year - 1);
            appendMonth(0, 12, year - 1);
        }
        else if (month == 2) {
            appendMonth(0, 12, year - 1);
            appendMonth(0, 1, year);
        }
        else {
            appendMonth(0, month - 2, year);
            appendMonth(0, month - 1, year);
        }

        appendMonth(day, month, year);

        if (month == 11) {
            appendMonth(0, 12, year);
            appendMonth(0, 1, year + 1);
        }
        else if (month == 12) {
            appendMonth(0, 1, year + 1);
            appendMonth(0, 2, year + 1);
        }
        else {
            appendMonth(0, month + 1, year);
            appendMonth(0, month + 2, year);
        }

        console.log("model count: " + model.count);
        console.log("list count: " + model.count);

        list.positionViewAtIndex(2, ListView.Beginning);
        pos = 2;
        list.currentIndex = 2;
    }

    function prependMonth(day, month, year) {
        model.insert(0, {"day": day, "month": month, "year": year, "organizer": root});
    }


    function appendMonth(day, month, year) {
        model.append({"day": day, "month": month, "year": year, "organizer": root});
    }


    /*

        console.log("today: " + tdate.day  + " " + tdate.month + " " + tdate.year);
        console.log("day: " + tdate.todayDayOfMonth + " " + tdate.todayDayOfWeek + " " + tdate.todayDayOfYear);

        console.log("dayOfWeek: " + tdate.dayOfWeek(13, 10, 2012));
        console.log("dayOfYear: " + tdate.dayOfYear(1, 1, 2013));
        console.log("daydifference: " + tdate.dayDifference(1, 1, 2000, 1, 1, 2002));
        console.log("daysiinmonth: " + tdate.daysInMonth(12, 2001));
        console.log("weekofyear: " + tdate.weekOfYear(20, 1, 2013));

    */

    function monthFromNumber(number) {

        var name;

        switch (number) {
        case 1: name = "January";
            break;
        case 2: name = "February";
            break;
        case 3: name = "March";
            break;
        case 4: name = "April";
            break;
        case 5: name = "May";
            break;
        case 6: name = "June";
            break;
        case 7: name = "July";
            break;
        case 8: name = "August";
            break;
        case 9: name = "September";
            break;
        case 10: name = "October";
            break;
        case 11: name = "November";
            break;
        case 12: name = "December";
            break;
        }

        return name;
    }

    function setDisplayDate(month, year) {
        currentMonth = monthFromNumber(month);
        currentYear = year;
    }

    function sayHi(day) {
        console.log("hi say day " + day);
    }

    function showEvents(day) {
        var component = Qt.createComponent("Organizer/EventMenu.qml");
        component.createObject(root);
    }

}
