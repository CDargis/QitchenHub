import QtQuick 2.0

Rectangle {
    width: 325
    height: 75
    radius:5
    gradient: Gradient {
        GradientStop {
            position: 0.0; color: "#7c7c85" }

        GradientStop {
            position: 1.0; color: "#25242a" }}



anchors.centerIn: parent
Text{id:loadText
    font.family: "Helvetica"
    font.bold: true
    text:"Loading.."
    anchors.centerIn: parent
    color:"white"
    font.pixelSize: 40
}
AnimatedImage { id: animation; source: "images/ajax-loader.gif"
  width: 42; height: 42
  x:270
  y:loadText.y
}

   Rectangle {





   }
}
