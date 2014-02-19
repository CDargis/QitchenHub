import QtQuick 2.0

import QtQuick 2.0
import ".."

WidgetInterface {
    id: root
    height: 150
    property string source2
    Rectangle {
        id: image
        radius: 5
        anchors.fill: parent
        border.width: 1
        border.color: "#000000"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#222222" }
            GradientStop { position: 1.0; color: "#444444" }
        }
        Image{
            smooth: true
            source: source2
            height: root.height*.76
            width: height*1.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.width*.009
        }
    }
    Image{
        id: backArrow
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        source: "qrc:/images/rssBackArrow.png"
        width: parent.width*.15
        height: parent.width*.15
        anchors.leftMargin: parent.width*.02
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.source2 = app.dec();
            }
        }
    }
    Image{
        id: forwardArrow
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: "qrc:/images/rssForwardArrow.png"
        width: parent.width*.15
        height: parent.width*.15
        anchors.rightMargin: parent.width*.02
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.source2 = app.inc();
            }
        }
    }
    Component.onCompleted: {
        source2 = app.setSource22();
    }
    function setSource2(){

    }
}
