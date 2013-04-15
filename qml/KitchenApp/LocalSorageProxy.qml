import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {
    id: root

    property string globalDB: "GlobalDB"
    property var input
    property var events

    function storeEvent(jsonDate) {
        input = jsonDate;
        //openDB(globalDB);
        addEvent();
        //dropEvents();
        readEvents();
    }







    function openDB(dbname) {
        var db = LocalStorage.openDatabaseSync(dbname, "1.0", "Organizer", 1000000);

        //db.transaction(test);
        return db;
    }



    function test(tx) {
        var ip;

        ip = tx.executeSql("create table IF NOT EXISTS Sample(text1 TEXT, text2 TEXT)");

        ip = tx.executeSql("insert into Sample values(?, ?)", ["hello", "world"]);

        var rs = tx.executeSql("select * from Sample");

        for (var i = 0; i < rs.rows.length; ++i) {
            console.log(rs.rows.item(i).text1 + " " + rs.rows.item(i).text2);
        }

        tx.executeSql("drop table Sample");
    }

    function init(dbname) {
        var  db = openDB(dbname);
        db.transaction(createEventsTable);
        return db;
    }

    function createEventsTable(tx) {
        tx.executeSql("create table IF NOT EXISTS Events(uid varchar(40) not null," +
            "start_date date not null," +
            "start_time time not null," +
            "title varchar(100) not null," +
            "location varchar(100)," +
            "description varchar(1000)," +
            "end_date date," +
            "end_time time)"); //"," +
            //"PRIMARY KEY (uid))");
    }

    function readAllFromEventsTable(tx) {
        var response = tx.executeSql("select * from Events");

        for (var i = 0; i < response.rows.length; ++i) {
            console.log(response.rows.item(i).uid + " " + response.rows.item(i).start_date + " " +
                        response.rows.item(i).start_time + " " + response.rows.item(i).title + " " +
                        response.rows.item(i).location + " " + response.rows.item(i).description + " " +
                        response.rows.item(i).end_date + " " + response.rows.item(i).end_time);
        }
    }

    function addEvent() {
        var db = init(globalDB);
        db.transaction(addEventCallBack);
        db.transaction(readAllFromEventsTable);
    }


    function addEventCallBack(tx) {
        tx.executeSql("insert into Events values(?, ?, ?, ?, ?, ?, ?, ?)",
                      [input.uid,
                      input.start_date,
                      input.start_time,
                      input.title,
                      input.location,
                      input.description,
                      input.end_date,
                      input.end_time]);

    }

    function dropEventsTable(tx) {
        tx.executeSql("drop table Events");
    }

    function dropEvents() {
        var db = openDB(globalDB);
        db.transaction(dropEventsTable);
    }

    function readEvents() {
        var db = init(globalDB);
        db.transaction(readEventsCallBack);
    }

    function readEventsCallBack(tx) {
        var response = tx.executeSql("select * from Events");

        if (events == null)
            events = new Array;

        var end = events.length;

        for (var i = 0; i < response.rows.length; ++i) {
            var start_date = response.rows.item(i).start_date.split("-");
            var end_date = response.rows.item(i).end_date.split("-");
            var start_time = response.rows.item(i).start_time.split(":");
            var end_time = response.rows.item(i).end_time.split(":");

            events[i+end] = {"uid": response.rows.item(i).uid,
                "day": start_date[2],
                "month": start_date[1],
                "year": start_date[0],
                "hour": start_time[0],
                "minute": start_time[1],
                "title": response.rows.item(i).title,
                "location": response.rows.item(i).location,
                "description": response.rows.item(i).description,
                "dayTo": end_date[2],
                "monthTo": end_date[1],
                "yearTo": end_date[0],
                "hourTo": end_time[0],
                "minuteTo": end_time[1]};
        }
    }

    function grabFirst(string) {
        return string.charAt(0) + "" + string.charAt(1);
    }

    function grabSecond(string) {
        return string.charAt(3) + "" + string.charAt(9);
    }
}
