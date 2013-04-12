import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "Organizer"

AppInterface {
    id: root
    anchors.fill: parent
    property string title: "23"

    property date data


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

    Column {
        id: holder
        width: root.width
        height: root.height * 0.9
        y: root.height * 0.1

        Row {
            Column {
                id: weeks

                property int childWidth: 50


            }

            Grid {
                id: days
                rows: 6
                columns: 7
                columnSpacing: 2
                rowSpacing: 2

                property int childWidth: (holder.width - weeks.childWidth - ((columns - 1) * columnSpacing)) / columns;
                property int childHeight: (holder.height - ((rows - 1) * rowSpacing)) / rows


            }
        }
    }

    Component.onCompleted: {
        languageChange(theMainApplication.language)  // Set the language
        speaker.say(qsTr("Organizer"));

        console.log(root.width);
        refresh();
    }

    function refresh() {

        var tdate = getDateObject();

        console.log("today: " + tdate.day  + " " + tdate.month + " " + tdate.year);
        console.log("day: " + tdate.todayDayOfMonth + " " + tdate.todayDayOfWeek + " " + tdate.todayDayOfYear);

        console.log("dayOfWeek: " + tdate.dayOfWeek(13, 10, 2012));
        console.log("dayOfYear: " + tdate.dayOfYear(1, 1, 2013));
        console.log("daydifference: " + tdate.dayDifference(1, 1, 2000, 1, 1, 2002));
        console.log("daysiinmonth: " + tdate.daysInMonth(12, 2001));
        console.log("weekofyear: " + tdate.weekOfYear(1, 11, 2012));

        //console.log(tdate.year())
        Date.prototype.getWeek = function() {
        var onejan = new Date(this.getFullYear(),0,1);
        return Math.ceil((((this - onejan) / 86400000) + onejan.getDay()+1)/7) - 1;
        }

        var todayM = tdate.todayDayOfMonth;
        var todayW = tdate.todayDayOfWeek;
        var month = tdate.month;
        console.log("month: " + month);
        var year = tdate.year;
        var todayY = tdate.dayOfYear(todayM, month, year);
        var days = tdate.daysInMonth(month, year);
        var firstW = (todayM % 7) - todayW;
        var lastW = days % 7;
        var roomLeft = 7 * 6;

        var lastMonth = month - 1;
        var lastYear = year;
        if (month == 0) {
            lastMonth = 11;
            lastYear = year - 1;
        }
        var daysLastMonth = tdate.daysInMonth(lastMonth, lastYear);

        var weekY = tdate.weekOfYear(todayM, month, year);
        console.log("week: " + weekY);

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

        // weeks *****************************************
        for (var i = 0; i < 7; ++i) {
            createWeek(weekY);
        }

        console.log(todayM + " " + todayW);
    }





    // pass today's date


    //function firstWeekOfMonth(month, year)

    function firstweekDayOfYear(dateObject) {

    }

    function createDay(number, color) {
        var component = Qt.createComponent("Organizer/DayItem.qml");

        var item = component.createObject(days, {"number": number, "color2": color});
        item.width = days.childWidth;
        item.height = days.childHeight;
    }

    function createWeek(number) {
        var component = Qt.createComponent("Organizer/WeekItem.qml");

        var item = component.createObject(weeks, {"number": number});
        item.width = weeks.childWidth;
        item.height = days.childHeight;
    }


    function getDateObject() {


        var date = new Date();
        var odate = new Object();


        odate.isLeap = function(year) {
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

        // 1 - 365 or 366 if leap
        odate.dayOfYear = function(day, month, year) {

            var days = 0;

            var selector = month - 1;

            switch (selector) {
            case 11: days += 30;
            case 10: days += 31;
            case 9: days += 30;
            case 8: days += 31;
            case 7: days += 31;
            case 6: days += 30;
            case 5: days += 31;
            case 4: days += 30;
            case 3: days += 31;
            case 2: days += 28;
                if (odate.isLeap(year))
                    days += 1;
            case 1: days += 31;
            }

            days += day;

            return days;
        }


        odate.day = date.getDate();
        odate.month = date.getMonth() + 1;
        odate.year = date.getFullYear();
        odate.todayDayOfMonth = odate.day;
        odate.todayDayOfWeek = date.getDay();
        odate.todayDayOfYear = odate.dayOfYear(odate.day, odate.month, odate.year);

        odate.dayOfWeek = function(day, month, year) {

            var date = new Date();
            date.setDate(day);
            date.setMonth(month - 1);
            date.setFullYear(year);

            return date.getDay();
        };

        odate.dayDifference = function(day1, month1, year1, day2, month2, year2) {

            var daysyear1 = 365;
            if (odate.isLeap(year1))
                ++daysyear1;

            var daysLeftYear1;

            if (year1 == year2)
                daysLeftYear1 = -1;
            else
                daysLeftYear1 = daysyear1 - (odate.dayOfYear(day1, month1, year1));

            var days = 0;

            for (var i = year2; i > year1 + 1; --i) {
                days += 365;
                if (odate.isLeap(i))
                    ++days;
            }

            return daysLeftYear1 + days + odate.dayOfYear(day2, month2, year2);
        }

        odate.daysInMonth = function(month, year) {
            if (month < 8) {
                if (month === 2) {
                    if (odate.isLeap(year))
                        return 29;
                    else
                        return 28;
                }
                else {
                    if (month % 2 == 1)
                        return 31;
                    else
                        return 30;
                }
            }
            else {
                if (month % 2 == 0)
                    return 31;
                else
                    return 30;
            }
        }

        odate.weekOfYear = function(day, month, year) {
            var dayofyear = odate.dayOfYear(day, month, year);
            dayofyear += odate.dayOfWeek(day, month, year) - 1;
            var week = Math.ceil(dayofyear / 7);

            return week;
        }

        return odate;
    }

}
