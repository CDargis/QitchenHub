import QtQuick 2.0
import QtQuick 2.0
import ".."

Item {
    id: root
    anchors.fill: parent;
    property string source1
    property GridView view
    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.9
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.destroy()}
        }
    }

    Image{
        id: backArrow
        anchors.right: viewArea.left
        source: "qrc:/images/rssBackArrow.png"
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width*.05
        height: parent.width*.05
        anchors.rightMargin: parent.width*.02
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.source1 = dec();
            }
        }
    }

    Rectangle {
        id: viewArea
        anchors.centerIn: parent
        width: childrenRect.width
        height: childrenRect.height
        color: "#000000"
        border.color: "#36c60f"
        border.width: 1
        Image{
            width: 1980*.5
            height: 1080*.5
            source: source1
            smooth: true
        }
        MouseArea {
            anchors.fill: parent
        }
    }

    Image{
        id: forwardArrow
        source: "qrc:/images/rssForwardArrow.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: viewArea.right
        anchors.leftMargin: parent.width*.02
        width: parent.width*.05
        height: parent.width*.05
        MouseArea{
            anchors.fill: parent
            onClicked: {
                source1 = inc();
            }
        }
    }
    Component.onCompleted: {
        speaker.say("Full Image");
    }
}

