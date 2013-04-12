import QtQuick 2.0

Rectangle {
    width: 50
    height: 62

    property int number: 0

    Text  {
        anchors.centerIn: parent
        color: "#36c60f"
        text: "w" + getNumber(number)
    }

    function getNumber(number) {
        if (number < 10)
            return "0" + number;
        else
            return number;
    }
}
