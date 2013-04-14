import QtQuick 2.0

Rectangle {
    width: days.childWidth
    height: parent.height
    radius: 5

    property string txt

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#222222" }
        //GradientStop { position: 0.5; color: "#444444" }
        GradientStop { position: 1.0; color: "#444444" }
    }
    Text {
        anchors.centerIn: parent
        text: txt
        font.pixelSize: 20
        color: "#36c60f"
        style: Text.Outline
        styleColor: "#3f503a"
    }
}
