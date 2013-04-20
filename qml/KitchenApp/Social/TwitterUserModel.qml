import QtQuick 2.0

Item {
    id: root
    property variant model: xmlModel
    property string user : ""
    //property int status: xmlModel.status
    XmlListModel {
        id: xmlModel
        source: user!= "" ? "http://api.twitter.com/1/users/show.xml?screen_name"+user : ""
        query: "/user"

        XmlRole { name: "name"; query: "name/string()" }
        XmlRole { name: "screenName"; query: "screen_name/string()" }
        XmlRole { name: "image"; query: "profile_image_url/string()" }
        XmlRole { name: "description"; query: "description/string()" }
        XmlRole { name: "location"; query: "location/string()" }
        XmlRole { name: "followers"; query: "followers_count/string()" }
    }
    function reload() { xmlModel.reload(); }
}
