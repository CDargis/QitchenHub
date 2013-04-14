import QtQuick 2.0

Rectangle {
    width: 100
    height: 62
    border.width: 1
    radius: 5

    property int number: 0
    property string color1: "#000000"
    property string color2: "#000000"

    gradient: Gradient {
        GradientStop { position: 0.0; color: color1 }
        GradientStop { position: 1.0; color: color2 }
    }
    Text  {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        font.pixelSize: 25
        color: "#36c60f"
        style: Text.Outline
        styleColor: "#3f503a"
        text: number
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("pressed");
            organizer.showEvents(number);
        }
    }
}
