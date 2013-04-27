import QtQuick 2.0
import QtWebKit 3.0
import "Social"
AppInterface{
    id: root
    widgetSrc: "Social/SocialWidget.qml"
    anchors.fill: parent
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
        WebView {
            id: webpage
            z: 100
            signal hideArrow
            url: ""
            width: parent.width
            height: parent.height*.95
            smooth: false
            visible: false
            onVisibleChanged: hideBackButton()
        }
    }
    function count(){
        return rssFeeds.count
    }
    function twUser(){
        twitter.widgetFunction()
    }
    function twUser2(){
        twitter.setUser1()
    }
    function twUser3(){
       return twitter.status
    }
}
