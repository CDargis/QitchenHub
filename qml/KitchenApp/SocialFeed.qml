import QtQuick 2.0
import "Social"
AppInterface{
    Rectangle{
        id:main
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        Facebook{
            id: facebook
            anchors.left: parent.left
            width: parent.width*0.25
            height: parent.height
        }
        Twitter{
            id: twitter
            anchors.left: facebook.right
            width: parent.width*0.25
            height: parent.height
        }
        Google{
            id: google
            anchors.left: twitter.right
            width: parent.width*0.25
            height: parent.height
        }
        Rss{
            id: rss
            RssFeeds { id: rssFeeds }
            DiscoveryViewModel{ id: discovery }
            anchors.left: google.right
            width: parent.width*0.25
            height: parent.height
        }
    }
}
