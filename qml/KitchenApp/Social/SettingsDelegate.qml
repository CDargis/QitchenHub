import QtQuick 2.0

Component{
    id: settingsDelegate
    Item {
        id: itemDelegate
        width: listFeeds.width;
        height: listFeeds.height*.2
        clip: true
            Text {
                id: feedTitle
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                anchors.verticalCenter: parent.verticalCenter
                text: name
                font.pixelSize: listFeeds.width*.06
                color: "white"
                font.bold: true
                font.italic: true
            }

            Image {
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.03
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/delete.png"
                width: listFeeds.width*.08
                height: listFeeds.width*.08
                smooth: true
                MouseArea { anchors.fill:parent; onClicked: rssFeeds.remove(index) }

        }
            Rectangle {
                width: itemDelegate.width; height: 1; color: "#cccccc"
                anchors.bottom: itemDelegate.bottom
            }
        ListView.onRemove: SequentialAnimation {
            PropertyAction { target: itemDelegate; property: "ListView.delayRemove"; value: true }
            NumberAnimation { target: itemDelegate; property: "height"; to: 0; duration: 250; easing.type: Easing.InOutQuad }
            PropertyAction { target: itemDelegate; property: "ListView.delayRemove"; value: false }
        }
    }
}
