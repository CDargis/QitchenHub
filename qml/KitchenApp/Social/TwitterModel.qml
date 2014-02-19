import QtQuick 2.0
import QtQuick.XmlListModel 2.0



XmlListModel {
    id: xmlModel
    property string user: twitterSettings.user
    property int status: xmlModel.status

    source: "https://search.twitter.com/search.atom?from=" + user

    namespaceDeclarations: "declare default element namespace 'http://www.w3.org/2005/Atom'; " +
                           "declare namespace twitter=\"http://api.twitter.com/\";";

    query: "/feed/entry"

    XmlRole { name: "statusText"; query: "content/string()" }
    XmlRole { name: "timestamp"; query: "published/string()" }
    XmlRole { name: "source"; query: "twitter:source/string()" }
    XmlRole { name: "name"; query: "author/name/string()" }
    XmlRole { name: "userImage"; query: "link[@rel = 'image']/@href/string()" }



    function reload() { xmlModel.reload(); }
}
