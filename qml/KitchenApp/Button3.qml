import QtQuick 2.0

Rectangle {

    width:buttonText.width + 47
    height:buttonText.height + 19
    property string bText: ""
    signal buttonClick()

    radius:10
    gradient: Gradient {
        GradientStop {id:g1
            position: 0.0; color: "#2a940a" }

        GradientStop { id:g2
            position: 1.0; color: "#36c80f" }
    }
Text
{
    id:buttonText
    color: "#126922"
    font.pointSize: 35
    anchors.centerIn: parent
    style: Text.Sunken
    font.family: "Helvetica[Neue]"
    font.bold: true
    text:bText
}
MouseArea{ id:mouseRegion
    anchors.fill: parent


}
states: [
    State {
        name: "Pressed"

        PropertyChanges {
            target: g1
            color:"#36c80f"


        }
        PropertyChanges {
            target: g2
            color:"#2a940a"


        }
    }
]
}
