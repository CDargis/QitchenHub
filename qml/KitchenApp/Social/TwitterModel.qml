import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Item {
    id: wrapper
    property variant model: xmlModel
    property string from : ""
    property string to : ""
    property string phrase : ""
    property string mode : "everyone"
    property int status: xmlModel.status
    XmlListModel {
        id: xmlModel

        source: (from=="" && to=="" && phrase=="") ? "" :
                                                     'http://search.twitter.com/search.atom?from='+from+"&to="+to+"&phrase="+phrase

        namespaceDeclarations: "declare default element namespace 'http://www.w3.org/2005/Atom'; " +
                               "declare namespace twitter=\"http://api.twitter.com/\";";

        query: "/feed/entry"

        XmlRole { name: "statusText"; query: "content/string()" }
        XmlRole { name: "timestamp"; query: "published/string()" }
        XmlRole { name: "source"; query: "twitter:source/string()" }
        XmlRole { name: "name"; query: "author/name/string()" }
        XmlRole { name: "userImage"; query: "link[@rel = 'image']/@href/string()" }

    }
    Binding {
        property: "mode"
        target: wrapper
        value: {if(wrapper.tags==''){"everyone";}else if(wrapper.tags=='my timeline'){"self";}else{"user";}}
    }
    function reload() { xmlModel.reload(); }
}
