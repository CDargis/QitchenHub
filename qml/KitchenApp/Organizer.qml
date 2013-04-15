import QtQuick 2.0
import "Organizer"

AppInterface {
    id: root
    anchors.fill: parent
    property string title: "23"

    property date data
    property string currentMonth
    property string currentYear

    property var events

    // for interior use only
    property real contentYCache
    property Item itemCache
    property int pos: 0;
    property int posCache

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
        highlightFollowsCurrentItem: false
        //anchors.fill: parent
        model: model
        delegate: MonthItem {
            width: list.width
            height: list.height
        }

        onDragStarted: {

            contentYCache = contentY;
            var point = list.mapToItem(list.contentItem, list.width*0.5, list.height*0.5);
            itemCache = list.itemAt(point.x, point.y);
            posCache = pos;

        }

        onDragEnded: {

            // if up
            if (list.contentY < contentYCache)
                --pos;
            else
                ++pos;

        }

        onMovementEnded: {

            var point = list.mapToItem(list.contentItem, list.width*0.5, list.height*0.5);
            var item = list.itemAt(point.x, point.y);

            if (item != itemCache) {

                // we went up
                if (pos < posCache) {

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
                else {  // we went down

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

                item = applyEvents(pos);
                item.applyEvents();
            }
            // we ended back at the same position
            // roll back pos changes
            else
                pos = posCache;

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

        retrieveEvents();

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

        applyEvents(pos);
        list.currentItem.applyEvents();
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
        case 1: name = qsTr("January") + tr.emptyString;
            break;
        case 2: name = qsTr("February") + tr.emptyString;
            break;
        case 3: name = qsTr("March") + tr.emptyString;
            break;
        case 4: name = qsTr("April") + tr.emptyString;
            break;
        case 5: name = qsTr("May") + tr.emptyString;
            break;
        case 6: name = qsTr("June") + tr.emptyString;
            break;
        case 7: name = qsTr("July") + tr.emptyString;
            break;
        case 8: name = qsTr("August") + tr.emptyString;
            break;
        case 9: name = qsTr("September") + tr.emptyString;
            break;
        case 10: name = qsTr("October") + tr.emptyString;
            break;
        case 11: name = qsTr("November") + tr.emptyString;
            break;
        case 12: name = qsTr("December") + tr.emptyString;
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

    function showEvents(day, month, year, events) {
        var component = Qt.createComponent("Organizer/EventMenu.qml");
        var object = component.createObject(root, {"day": day, "month": month, "year": year, "parentItem": root});
        object.eventData = events;
        object.showEvents();
    }

    function storeEvent(jsonDate) {
        jsonDate.uid = statusBar.usrName;
        lsproxy.storeEvent(jsonDate);
    }

    function retrieveEvents() {

        lsproxy.readEvents();

        var allEvents = lsproxy.events;
        if (events !== null)
            events = new Array;
        var start = events.length;

        for (var i = 0; i < allEvents.length; ++i) {
            events[i+start] = allEvents[i];
        }
    }


    function applyEvents(position) {

        var point = list.mapToItem(list.contentItem, list.width*0.5, list.height*0.5);

        console.debug(point.x + " " + point.y);

        var item = list.itemAt(point.x, point.y);


        console.log("current: " + item.getMonth());

        if (list.currentItem.allEvents != undefined)
            list.currentItem.allEvents = undefined;

        var allEvents = new Array;
        var index = 0;

        for (var i = 0; i < events.length; ++i) {

            var month = events[i].month;

            console.debug("Month in position: " + model.get(position).month);

            if (model.get(position).month == month) {
                allEvents[index] = events[i];
                ++index;
            }
        }
        item.allEvents = allEvents;

        return item;
    }

}
