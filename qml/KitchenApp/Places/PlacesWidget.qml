import QtQuick 2.0
import QtWebKit 3.0
import ".."

WidgetInterface {
    id: root
    height: 300

    property string urlSrc: ""

    Rectangle {
        radius: 5
        anchors.fill: parent
        border.width: 1
        border.color: "#000000"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#222222" }
            GradientStop { position: 1.0; color: "#444444" }
        }
    }

    /*CommonText {
        id: title
        text: "Title"
        anchors.top: parent.top
    }*/

    /*Flickable {
        id: flick
        anchors.top: parent.top
        anchors.topMargin: 30
        width: parent.width
        height: parent.height - 30
        //contentHeight: 600
        //contentWidth: 800
        clip: true*/

        /*WebView {
            id: webView
            url: app.webView.url
            width: parent.width
            height: 370

           /* onLoadingChanged: {
                title.text = loadProgress;
            }*/

            /*onUrlChanged: {
                reload();
            }

        }*/
    //}

    Component.onCompleted: {
        console.log("Widget is here");
    }
}
