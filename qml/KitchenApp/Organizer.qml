import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "Organizer"

AppInterface {
    id: root
    anchors.fill: parent
    property string title: "23"

    Rectangle {
        anchors.fill: parent
        width: parent.width; height: parent.height
        z: 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#333333" }
            GradientStop { position: 1.0; color: "#111111" }
        }
    }

    Column {
        id: holder
        width: root.width
        height: root.height * 0.9
        y: root.height * 0.1

        Grid {
            id: view
            rows: 6
            columns: 7
            columnSpacing: 2
            rowSpacing: 2

            property int childWidth: (holder.width - ((columns - 1) * columnSpacing)) / columns
            property int childHeight: (holder.height - ((rows - 1) * rowSpacing)) / rows


        }
    }

    Component.onCompleted: {
        console.log(root.width);
        refresh();
    }

    function refresh() {
        var date = new Date();

        var todayM = date.getDate();
        var todayW = date.getDay();
        var month = date.getMonth();
        var year = date.getFullYear();
        var todayY = dayOfYear(todayM, month, year);
        var days = dayCount(month, year);
        var firstW = (todayM % 7) - todayW;
        var lastW = days % 7;
        var roomLeft = 7 * 6;

        var lastMonth = month - 1;
        var lastYear = year;
        if (month == 0) {
            lastMonth = 11;
            lastYear = year - 1;
        }
        var daysLastMonth = dayCount(lastMonth, lastYear);


        //*************************************************
        if (firstW == 0) {
            for (var i = 6; i >= 0; --i) {
                createDay(daysLastMonth - i, "#111111");
                --roomLeft;
            }
        }
        else {
            for (var i = firstW; i > 0; --i) {
                createDay(daysLastMonth - i, "#111111");
                --roomLeft;
            }
        }
        //************************************************
        for (var i = 0; i < days; ++i) {
            createDay(i+1, "#333333");
            --roomLeft;
        }
        //************************************************
        for (var i = 0; i < roomLeft; ++i) {
            createDay(i+1, "#111111");
        }
        //************************************************


        console.log(todayM + " " + todayW);
    }

    function isLeap(year) {
        if (year % 4 == 0) {
            if (year % 100 == 0) {
                if (year % 400 == 0)
                    return true;
                else
                    return false;
            }
            else
                return true;
        }
        else
            return false;
    }

    function dayCount(month, year) {

        if (month < 7) {
            if (month == 1) {
                if (isLeap(year))
                    return 29;
                else
                    return 28;
            }
            else {
                if (month % 2 == 0)
                    return 31;
                else
                    return 30;
            }
        }
        else {
            if (month % 2 == 1)
                return 31;
            else
                return 30;
        }
    }

    function dayOfYear(day, month, year) {
        var days = 0;

        var selector = month - 1;

        switch (selector) {
        case 10: days += 30;
        case 9: days += 31;
        case 8: days += 30;
        case 7: days += 31;
        case 6: days += 31;
        case 5: days += 30;
        case 4: days += 31;
        case 3: days += 30;
        case 2: days += 31;
        case 1: days += 27;
            if (isLeap(year))
                days += 1;
        case 0: days += 31;
        }

        days += day;

        return days;
    }

    function createDay(number, color) {
        var component = Qt.createComponent("Organizer/DayItem.qml");

        var item = component.createObject(view, {"number": number, "color2": color});
        item.width = view.childWidth;
        item.height = view.childHeight;
    }
}
