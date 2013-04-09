import QtQuick 2.0

Rectangle {
    width: 100
    height: 62
    border.width: 1
    radius: 5

    property int number: 0
    property color color2: "#000000"

    gradient: Gradient {
        GradientStop { position: 0.0; color: color2 }
        GradientStop { position: 1.0; color: "#111111" }
    }
    Text  {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        color: "#36c60f"
        text: number
    }
}
