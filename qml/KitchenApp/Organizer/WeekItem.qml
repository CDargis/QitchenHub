import QtQuick 2.0

Rectangle {
    width: 50
    height: 62
    border.width: 1
    radius: 5

    property int number: 0

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#222222" }
        GradientStop { position: 0.5; color: "#444444" }
        GradientStop { position: 1.0; color: "#222222" }
    }

    Text  {
        anchors.centerIn: parent
        font.pixelSize: 20
        color: "#36c60f"
        style: Text.Outline
        styleColor: "#3f503a"
        text: "w" + getNumber(number)
    }

    function getNumber(number) {
        if (number < 10)
            return "0" + number;
        else
            return number;
    }
}
