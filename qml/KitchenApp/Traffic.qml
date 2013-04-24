import QtQuick 2.0
import QtWebKit 3.0

AppInterface {
    widgetSrc: "Traffic/TrafficWidget.qml"

    property string currentLocation: theMainApplication.currentLocation

    CommonText {
        id: title
        anchors.bottom: webView.top
        anchors.bottomMargin: 3
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Traffic information for") + ": " + currentLocation + tr.emptyString
    }


    WebView {
        id: webView
        y: parent.height * 0.1
        height: parent.height * 0.9
        width: parent.width

        url: "Traffic/main.html"
    }

    Component.onCompleted: {
        speaker.say(title.text.toString());
    }

    function url() {
        return webView.url;
    }

    function location() {
        return currentLocation;
    }

}
