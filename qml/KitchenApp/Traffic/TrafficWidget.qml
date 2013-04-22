import QtQuick 2.0
import QtWebKit 3.0
import ".."

WidgetInterface {
    id: root
    height: 300

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

    CommonText {
        id: title
        text: app.location()
        anchors.top: parent.top
        font.pixelSize: 20
    }

    WebView {
        id: webView
        width: parent.width
        height: parent.height - 30
        y: 30

        onUrlChanged: {
            reload();
        }

    }

    Component.onCompleted: {
        webView.url = app.url();
    }
}
