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

        url:"https://maps.google.co.in/maps?saddr=Taylor+Made+Pizza,+1220+West+Taylor+Street,+Chicago,+IL,+USA&daddr=Tuscany,+West+Taylor+Street,+Chicago,+IL,+United+States&hl=en&sll=30.498446,-7.316811&sspn=89.366764,186.152344&geocode=FbzgfgIdunPG-iEibuu5cP715CnBlRxy4iwOiDEibuu5cP715A%3BFQ3hfgIdCorG-iF0ajY7puxFVylXjCdA5CwOiDF0ajY7puxFVw&oq=tuscan&mra=ls&t=m&z=17"    }

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
