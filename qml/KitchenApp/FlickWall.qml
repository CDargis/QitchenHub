

import QtQuick 2.0

Flickable {
    id:wall
<<<<<<< HEAD
//    width: parent.width ; height: parent.height
    anchors.fill: parent

=======
//   width: parent.width ; height: parent.height
    anchors.top: parent.top
    anchors.topMargin: parent.height*0.1
       // Component.onCompleted: {opacity:1}
        width: parent.width ; height: parent.height*0.9
>>>>>>> master
    contentWidth: 7000; contentHeight: 59
    flickableDirection: Flickable.HorizontalFlick
    clip: true



FlickItem{
    }}



