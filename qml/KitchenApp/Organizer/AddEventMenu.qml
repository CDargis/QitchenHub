import QtQuick 2.0
import ".."
import "DateObject.js" as DateSource

Item {
    id: root
    anchors.fill: parent;

    property int windowHeight

    property int day: 0
    property int month: 0
    property int year: 0
    property int hour: 1
    property int minute: 5
    property int dayTo: day
    property int monthTo: month
    property int yearTo: year
    property int hourTo: hour + 1
    property int minuteTo: minute

    property Item parentItem

    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.0

        MouseArea {
            anchors.fill: parent
            onClicked: root.destroy();
        }
    }

    Rectangle {
        id: window
        anchors.centerIn: parent
        width: root.width * 0.5
        height: windowHeight
        color: "#000000"
        border.color: "#36c60f"
        border.width: 1


        CommonText {
            id: windowTitle
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: window.top
            anchors.topMargin: 5
            text: qsTr("New Event") + " " + parentItem.monthFromNumber(month) + " " + day + ", " + year + tr.emptyString
        }

        CommonText {
            anchors.right: title.left
            anchors.rightMargin: 5
            anchors.verticalCenter: title.verticalCenter
            text: qsTr("Title:") + tr.emptyString
        }

        VirtualInput {
            id: title
            width: window.width * 0.5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: windowTitle.bottom
            anchors.topMargin: 5
        }

        CommonText {
            anchors.right: location.left
            anchors.rightMargin: 5
            anchors.verticalCenter: location.verticalCenter
            text: qsTr("Location:") + tr.emptyString
        }

        VirtualInput {
            id: location
            width: window.width * 0.5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: title.bottom
            anchors.topMargin: 5
        }

        CommonText {
            anchors.right: desc.left
            anchors.rightMargin: 5
            anchors.verticalCenter: desc.verticalCenter
            text: qsTr("Description:") + tr.emptyString
        }

        VirtualInput {
            id: desc
            width: window.width * 0.5
            height: location.height * 2
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: location.bottom
            anchors.topMargin: 5
        }

        CommonText {
            id: startTime
            anchors.horizontalCenter: window.horizontalCenter
            anchors.top: desc.bottom
            anchors.topMargin: 5
            text: qsTr("Start Time") + tr.emptyString
        }


        //**************************** from input set **********************************************************
        Item {
            id: from
            anchors.top: startTime.bottom
            anchors.horizontalCenter: window.horizontalCenter
            anchors.topMargin: 5
            width: window.width
            height: from1.height

            //************ from month *******************************
            Column {
                id: from1
                x: parent.width * 1/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromMonth(month - 1);
                        }
                    }
                }
                CommonText {
                    text: parentItem.monthFromNumber(month);
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromMonth(month + 1);
                        }
                    }
                }
            }

            //*********************** from day ***************************
            Column {
                x: parent.width * 3/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromDay(day + 1);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: day
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromDay(day - 1);
                        }
                    }
                }
            }

            //*********************** from Year ***************************
            Column {
                x: parent.width * 5/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromYear(year + 1);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: year
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromYear(year - 1);
                        }
                    }
                }
            }

            //*********************** from hour ***************************
            Column {
                x: parent.width * 7/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromHour(hour + 1);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: hour
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromHour(hour - 1);
                        }
                    }
                }
            }

            //*********************** from minute ***************************
            Column {
                x: parent.width * 9/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromMinute(minute + 5);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: minute
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setFromMinute(minute - 5);
                        }
                    }
                }
            }
        }


        CommonText {
            id: endTime
            anchors.horizontalCenter: window.horizontalCenter
            anchors.top: from.bottom
            anchors.topMargin: 40
            text: qsTr("End Time") + tr.emptyString
        }



        //**************************** to input set **********************************************************
        Item {
            id: to
            anchors.top: endTime.bottom
            anchors.horizontalCenter: window.horizontalCenter
            anchors.topMargin: 5
            width: window.width

            //************ to month *******************************
            Column {
                x: parent.width * 1/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToMonth(monthTo - 1);
                        }
                    }
                }
                CommonText {
                    text: parentItem.monthFromNumber(monthTo);
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToMonth(monthTo + 1);
                        }
                    }
                }
            }

            //*********************** to day ***************************
            Column {
                x: parent.width * 3/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToDay(dayTo + 1);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: dayTo
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToDay(dayTo - 1);
                        }
                    }
                }
            }

            //*********************** to Year ***************************
            Column {
                x: parent.width * 5/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToYear(yearTo + 1);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: yearTo
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToYear(yearTo - 1);
                        }
                    }
                }
            }

            //*********************** to hour ***************************
            Column {
                x: parent.width * 7/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToHour(hourTo + 1);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: hourTo
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToHour(hourTo - 1);
                        }
                    }
                }
            }

            //*********************** to minute ***************************
            Column {
                x: parent.width * 9/10 - width/2;
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/up-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToMinute(minuteTo + 5);
                        }
                    }
                }
                CommonText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: minuteTo
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/down-arrow-icon.png"
                    width: 40
                    height: width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            setToMinute(To - 5);
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        var date = new Date();

        hour = date.getHours();
        minute = date.getMinutes();

        minute = Math.ceil(minute / 5) * 5;

        if (minute == 60)
            minute = 0;
    }
    //************************************* start time functions ******************************************
    function setFromMonth(newValue) {

        if (newValue === 0)
            month = 12;
        else if (newValue === 13)
            month = 1;
        else
            month = newValue;
    }

    function setFromDay(newValue) {

        var d = new Date();
        d.setDate(day);
        d.setMonth(month);
        d.setFullYear(year);

        var odate = DateSource.getDateObject(d);
        var daysInMonth = odate.daysInMonth(month, year);

        if (newValue === 0)
            day = daysInMonth;
        else if (newValue === daysInMonth + 1)
            day = 1;
        else
            day = newValue;
    }

    function setFromYear(newValue) {
        year = newValue;
    }

    function setFromHour(newValue) {
        if (newValue === 24)
            hour = 0;
        else if (newValue === -1)
            hour = 23;
        else
            hour = newValue;
    }

    function setFromMinute(newValue) {
        if (newValue === 60)
            minute = 0;
        else
            minute = newValue;
    }


    //************************************* end time functions ******************************************
    function setToMonth(newValue) {

        if (newValue === 0)
            monthTo = 12;
        else if (newValue === 13)
            monthTo = 1;
        else
            monthTo = newValue;
    }

    function setToDay(newValue) {

        var d = new Date();
        d.setDate(day);
        d.setMonth(month);
        d.setFullYear(year);

        var odate = DateSource.getDateObject(d);
        var daysInMonth = odate.daysInMonth(month, year);

        if (newValue === 0)
            dayTo = daysInMonth;
        else if (newValue === daysInMonth + 1)
            dayTo = 1;
        else
            dayTo = newValue;
    }

    function setToYear(newValue) {
        yearTo = newValue;
    }

    function setToHour(newValue) {
        if (newValue === 24)
            hourTo = 0;
        else if (newValue === -1)
            hourTo = 23;
        else
            hourTo = newValue;
    }

    function setToMinute(newValue) {
        if (newValue === 60)
            minuteTo = 0;
        else
            minuteTo = newValue;
    }
}
