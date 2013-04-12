import QtQuick 2.0

Rectangle {
    border.color: color2
    border.width: 1
    color: color1

    property string lower: ""
    property string upper: ""
    property string special: ""
    property string altLower: ""
    property string altUpper: ""
    property var keyboard
    property string color1: "black"
    property string color2: "white"
    property int fontSize: 20

    Text {
        id: theText
        anchors.centerIn: parent
        font.family: fontFamily
        font.pixelSize: fontSize
        color: color2
        text: {
            if((keyboard !== 'undefined') && (keyboard.special))
                special
            else if((keyboard !== 'undefined') && (keyboard.shift))
                (keyboard.alt && (altUpper.length === 1)) ? altUpper : upper
            else (keyboard.alt && (altLower.length === 1)) ? altLower : lower
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: keyboard.keyPress(theText.text)

        // Invert colors when typing
        onPressed: {
            var temp = color1
            color1 = color2
            color2 = temp
        }
        onReleased: {
            var temp = color1
            color1 = color2
            color2 = temp
        }
    }
}
