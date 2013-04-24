import QtQuick 2.0

Item {
    id: delegate
    width: delegate.ListView.view.width; height: delegate.ListView.view.trueHeight*.15
    property int realHeight: delegate.ListView.view.trueHeight*.15
    clip: true
    Rectangle {
        id: container
        width: delegate.width; height: realHeight; border.color: "#8b988b"; radius: delegate.width*.03
        anchors.bottom: delegate.bottom
        color: "gray"
        Text {
            id: feedTitle
            text: title
            width: container.width*.75
            elide: Text.ElideRight
            color: "white"
            font { family: "Sans"; pixelSize: realHeight*.3; bold: true }
            anchors {
                left: parent.left; leftMargin: parent.width*.08
                verticalCenter: parent.verticalCenter
            }
        }
        Image {
            id: openFeed
            source: "qrc:/images/openFeed.png"
            anchors.right: parent.right
            anchors.rightMargin: parent.width*.04
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width*.04
            height: parent.width*.04
            smooth: true
        }

    }

    MouseArea{
        anchors.fill: delegate
        onClicked: {
            delegate.ListView.view.currentIndex = index
            rssContent.story = feedTitles.get(index);
            page.setText();
            rssContent.viewStory();
            console.log()
        }
    }
}
