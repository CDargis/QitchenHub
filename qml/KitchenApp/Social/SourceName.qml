import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
    id: model
    property string url: rss.activeFeed
    source: "http://" + url
    query: "/rss/channel"
    //namespaceDeclarations: "declare default element namespace 'http://" + feedUrl + "';"
    XmlRole { name: "title"; query: "title/string()" }
    onStatusChanged: {
        if (status == XmlListModel.Ready) {
            for (var i=0; i<count; i++) {
                var item = get(i);
                rssFeeds.append({title: item.title, feed: url});
                //rssSett.resetState();
                console.log(rssFeeds.get(0).title + "i1");
                console.log(rssFeeds.get(1).title + "i2");
                //console.log(rssFeeds.get(3).title + "i3");
            }
        }
    }
}
