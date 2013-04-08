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
}

function createEventsTable(tx) {
    tx.executeSql("create table IF NOT EXISTS Events(uid int not null,
        start_date date not null,
        start_time time not null,
        title varchar(100) not null,
        location varchar(100),
        description varchar(1000),
        end_date date,
        end_time time),
        constraint pk_uid PRIMARY KEY (uid)");
}

function addEvent(tx)
{

}
