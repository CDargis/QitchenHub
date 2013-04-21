import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
    id: xmlModel
    property variant model: xmlModel
    property string user : twitterSettings.user
    source: "http://api.twitter.com/1/users/show.xml?screen_name="+user
    query: "/user"

    XmlRole { name: "name"; query: "name/string()" }
    XmlRole { name: "screenName"; query: "screen_name/string()" }
    XmlRole { name: "image"; query: "profile_image_url/string()" }
    XmlRole { name: "description"; query: "description/string()" }
    XmlRole { name: "location"; query: "location/string()" }
    XmlRole { name: "followers"; query: "followers_count/string()" }
    XmlRole { name: "following"; query: "friends_count/string()" }
    XmlRole { name: "tweets"; query: "statuses_count/string()" }
    function reload() { xmlModel.reload(); }
}


