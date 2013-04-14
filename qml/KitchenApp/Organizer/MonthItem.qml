import QtQuick 2.0
import "DateObject.js" as DateSource

Column {
    id: holder
    width: 1000
    height: 1000

    property bool done: false



    Row {
        id: weekDays
        width: parent.width
        height: 50
        spacing: 2
        Rectangle {
            width: weeks.childWidth
            height: parent.height
            opacity: 0.0
        }
        WeekDayItem {
            txt: qsTr("Mon") + tr.emptyString;
        }
        WeekDayItem {
            txt: qsTr("Tue") + tr.emptyString;
        }
        WeekDayItem {
            txt: qsTr("Wed") + tr.emptyString;
        }
        WeekDayItem {
            txt: qsTr("Thu") + tr.emptyString;
        }
        WeekDayItem {
            txt: qsTr("Fri") + tr.emptyString;
        }
        WeekDayItem {
            txt: qsTr("Sat") + tr.emptyString;
        }
        WeekDayItem {
            txt: qsTr("Sun") + tr.emptyString;
        }

    }

    Row {
        Column {
            id: weeks
            spacing: 2
            property int childWidth: 50
            /*Repeater {
                id: weekItems
                model: 6
                WeekItem {
                    height: days.childHeight
                    width: weeks.childWidth
                }
            }*/
            WeekItem {
                height: days.childHeight
                width: weeks.childWidth
            }
            WeekItem {
                height: days.childHeight
                width: weeks.childWidth
            }
            WeekItem {
                height: days.childHeight
                width: weeks.childWidth
            }
            WeekItem {
                height: days.childHeight
                width: weeks.childWidth
            }
            WeekItem {
                height: days.childHeight
                width: weeks.childWidth
            }
            WeekItem {
                height: days.childHeight
                width: weeks.childWidth
            }


        }

        Grid {
            id: days
            rows: 6
            columns: 7
            columnSpacing: 2
            rowSpacing: 2

            property int childWidth: (holder.width - weeks.childWidth - ((columns - 1) * columnSpacing)) / columns;
            property int childHeight: (holder.height - weekDays.height - ((rows - 1) * rowSpacing)) / rows

            /*Repeater {
                id: dayItems
                model: 42
                DayItem {
                 width: days.childWidth
                 height: days.childHeight
                }
            }*/
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }
            DayItem {
             width: days.childWidth
             height: days.childHeight
            }



        }
    }

    Component.onCompleted: {
        if (!done) {
            var date = new Date();
            date.setFullYear(year);
            date.setMonth(month - 1);
            if (day != 0)
                date.setDate(day);
            populate(date);
            done = true;
        }
    }

    function populate(date) {

        var tdate = DateSource.getDateObject(date);

        var day = tdate.day;
        var month = tdate.month;
        var year = tdate.year;

        var thisMonthsFirst = tdate.dayOfWeek(1, month, year);
        var daysOfPrevMonth = thisMonthsFirst - 1;
        if (daysOfPrevMonth == 0)
            daysOfPrevMonth = 7;
        var daysThisMonth = tdate.daysInMonth(month, year);
        var roomLeft = 6 * 7;
        var index = 0;

        if (month == 1)
            console.log("here");

        var lastMonth = month - 1;
        var lastYear = year;
        if (lastMonth == 0) {
            lastMonth = 12;
            lastYear = year - 1;
        }
        var daysLastMonth = tdate.daysInMonth(lastMonth, lastYear);
        var firstWeek;
        if (month == 1)
            firstWeek = tdate.weekOfYear(1, 1, year);
        else
            firstWeek = tdate.weekOfYear(daysLastMonth - 1, lastMonth, lastYear);


        for (var i = daysOfPrevMonth - 1; i >= 0; --i) {
            createDay(index, daysLastMonth - i, "#000000", "#000000");
            --roomLeft;
            ++index;
        }
        for (var i = 1; i <= daysThisMonth; ++i) {
            createDay(index, i, "#333333", "#444444");
            --roomLeft;
            ++index;
        }
        for (var i = 1; i <= roomLeft; ++i) {
            createDay(index, i, "#000000", "#000000");
            ++index;
        }
        for (var i = 0; i < 6; ++i) {
            createWeek(i, firstWeek+i);
        }
    }





    function createDay(index, number, color1, color2) {
        days.children[index].width = days.childWidth;
        days.children[index].height = days.childHeight;

        days.children[index].number = number;
        days.children[index].color1 = color1;
        days.children[index].color2 = color2;
    }


    function createWeek(index, number) {
        weeks.children[index].width = weeks.childWidth;
        weeks.children[index].height = days.childHeight;
        weeks.children[index].number = number;
    }

    function getMonth() {
        return month;
    }

    function getYear() {
        return year;
    }
}
