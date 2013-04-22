import QtQuick 2.0
WidgetInterface
{property string txt: app.currentTemp
    property string url: app.iconURL
 height:60
 Rectangle
 {opacity:0.8
     anchors.fill: parent
     radius :4
     color:"black"
     Text {
         id: name
     text:txt+"°"
     color:"white"
     font.pixelSize: 40
     font.family: "Helvetica"
     anchors.right: icon.right
     anchors.rightMargin: -icon.height*1.28
     anchors.verticalCenter: icon.verticalCenter
     }
     Text {

         text:"Chicago,IL"
     color:"white"
     font.pixelSize: 15
     font.family: "Helvetica"
     anchors.right: icon.right
     anchors.rightMargin: icon.height*0.95
     anchors.verticalCenter: icon.verticalCenter
     anchors.margins: 5


     }
     Image {
         id:icon
anchors.centerIn: parent
         source: url
         width:48
         height:48

     }
 }
}
