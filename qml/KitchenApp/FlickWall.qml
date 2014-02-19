

import QtQuick 2.0

Flickable {
    id:wall
//   width: parent.width ; height: parent.height
    anchors.top: parent.top
    anchors.topMargin: parent.height*0.1
       // Component.onCompleted: {opacity:1}
        width: parent.width ; height: parent.height*0.9
    contentWidth: 7000; contentHeight: 59
    flickableDirection: Flickable.HorizontalFlick
    clip: true



FlickItem{
    }}



