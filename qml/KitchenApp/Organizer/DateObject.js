.pragma library


function getDateObject(date) {

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

        var weekday = date.getDay();

        // assure ISO starndard
        if (weekday == 0)
            weekday = 7;

        return weekday;
    };

    odate.dayDifference = function(day1, month1, year1, day2, month2, year2) {

        if (year1 <= year2)
            if (month1 <= month2)
                if (day1 <= day2) {

                    var daysyear1 = 365;
                    if (odate.isLeap(year1))
                        ++daysyear1;

                    var daysLeftYear1;

                    if (year1 == year2)
                        return odate.dayOfYear(day2, month2, year2) - odate.dayOfYear(day1, month1, year1);

                    daysLeftYear1 = daysyear1 - odate.dayOfYear(day1, month1, year1);

                    var days = 0;

                    for (var i = year2; i > year1 + 1; --i) {
                        days += 365;
                        if (odate.isLeap(i))
                            ++days;
                    }

                    return daysLeftYear1 + days + odate.dayOfYear(day2, month2, year2);
                }

        return -1;
    }

    odate.daysInMonth = function(month, year) {
        if (month == 12)
            console.log("here");
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
        var dayofweek = odate.dayOfWeek(day, month, year);
        dayofyear += -dayofweek + 10;
        var week = Math.floor(dayofyear / 7);

        return week;
    }


    return odate;
}
