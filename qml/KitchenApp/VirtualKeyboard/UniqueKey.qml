import QtQuick 2.0

Rectangle {
    border.color: color2
    border.width: 1
    color: color1

    property bool checked: false
    property bool boldOnChecked: false
    property var keyboard
    property string functor: ""
    property string color1: "black"
    property string color2: "white"
    property int fontSize: 20
    property string theText: ""

    signal pressed()

    Text {
        anchors.centerIn: parent
        font.family: fontFamily
        font.pixelSize: fontSize
        color: color2
        text: theText
        font.bold: boldOnChecked && checked
    }

    // Evaluate the functor passed and call the function, if there is one
    onCheckedChanged: {
        if(functor.length === 0)
            return
        eval(functor)
        doIt()
    }

    // Logic for color inversions on unique keys
    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.pressed()
            checked = !checked
            var temp
            if(boldOnChecked && checked) {
                temp = color1
                color1 = color2
                color2 = temp
            }
            if(boldOnChecked && !checked) {
                temp = color1
                color1 = color2
                color2 = temp
            }
        }
        // Invert colors when typing
        onPressed: {
            if(boldOnChecked)
                return
            var temp = color1
            color1 = color2
            color2 = temp
        }
        onReleased: {
            if(boldOnChecked)
                return
            var temp = color1
            color1 = color2
            color2 = temp
        }
    }
}
