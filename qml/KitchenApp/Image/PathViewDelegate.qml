import QtQuick 2.0

Rectangle{
    id: root
    width: grid.cellWidth*.8; height: grid.cellHeight*.8
    border.color: "#8b988b"
    border.width: width*.03
    Image {
        id: image
        anchors.centerIn: parent
        source: icon
        height: parent.height*.99
        width: parent.width*.99
        smooth: true
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            grid.currentIndex = index
            viewImage(icon)
            console.log(icon)
        }
    }
}
