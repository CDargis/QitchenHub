import QtQuick 2.0

WidgetInterface
{property string fname: app.widText
    height:200
    Rectangle

    {
        anchors.fill: parent
        radius:4
        gradient: Gradient {
            GradientStop {id:g1
                position: 0.0; color: "#7c7c85" }

            GradientStop { id:g2
                position: 1.0; color: "#7f7878" }
        }
    }

    Text {
        id:ingtitle
        color: "#ffffff"

        text: qsTr("Ingredients")+tr.emptyString
      // text:fname
        font.bold: true
        anchors.top: parent.top
      anchors.left: parent.left
      anchors.leftMargin: parent.width/3.2

        font.pointSize: 10
        font.family: "Helvetica"
    }
   Flickable
   {
    width:inglist.width
    height: 165
    anchors.top:ingtitle.bottom
    anchors.topMargin: ingtitle.height
    flickableDirection: Flickable.VerticalFlick
    contentWidth: inglist.width; contentHeight: inglist.height
    clip: true

    Text {
        id:inglist
        color: "#ffffff"
        width:192

       text:fname
        horizontalAlignment: Text.AlignHCenter

        font.pointSize: 10
        font.family: "Helvetica"
          wrapMode: Text.Wrap



    }
   }
}
