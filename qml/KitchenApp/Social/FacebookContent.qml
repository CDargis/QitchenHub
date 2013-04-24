import QtQuick 2.0

Flickable {
    id: gpContent
    flickableDirection: Flickable.VerticalFlick
    interactive: true
    clip: true
    contentHeight: column.height
    Column{
        id: column
        height: childrenRect.height
        width: parent.width
        Rectangle{
            id: item1
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height
            Image{
                id: icon1
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.01
                source: "qrc:/images/facebook.png"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name1
                anchors.left: icon1.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.07
                text: "David"
            }
            Text{
                id: time
                anchors.right: text1.right
                anchors.bottom: name1.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                color: "gray"
                text: "5:30 PM"
            }
            Text{
                id: text1
                anchors.top: name1.bottom
                anchors.left: icon1.right
                anchors.right: arrow1.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "A bunch of random text, just to see how this plays i raelly want odklsdf woi wonder dhd. But thats all"
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow1
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
    }
}
