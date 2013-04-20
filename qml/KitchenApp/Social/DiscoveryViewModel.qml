import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
    id: model
    property string feedUrl: rss.activeFeed
    source: "http://" + feedUrl
    query: "/rss/channel/item"
    property ListModel temp
    property int action
    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "link"; query: "link/string()"}
    XmlRole { name: "description"; query: "description/string()" }

    onStatusChanged: {
        if(action == 1){
            populateT();
        }
    }

    Component.onCompleted: {
        console.log(model.status);
    }


    function populateT(titles){
        if (status == XmlListModel.Ready) {
            console.log("Populating titles of size " + count);
            for (var i=0; i<count; i++) {
                var item = get(i);
                temp.append({title: item.title, link: item.link, description: item.description });
                console.log(temp.get(i).title);
            }
            action = 0;
            console.log("Finished Loading")
        }
        else{
           console.log("Loading....")
        }
    }
}


