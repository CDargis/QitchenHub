import QtQuick 2.0

Rectangle {
    id: mainRect
    radius: 15  // Rounded corners
    width: 100; height: 50
    border.color: "black"
    border.width: 1
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#36C60F" }
        GradientStop { position: 1.0; color: "#2B950A" }
    }

    property string buttonText: ""
    property int pointSize: 14
    property string iconSource: ""

    Text {
        id: bText
        anchors.centerIn: parent     // Center the text in the button
        text: buttonText
        font.pointSize: pointSize
    }
    Image {
        id: icon
        anchors.centerIn: parent   // Center the picture in the button
        source: iconSource
        width: parent.width * .5; height: parent.height * .5  // Constrain the image
    }

    // Function definitions------------------------------------------------

    function setText(t) {
        buttonText = t
        icon.visible = false
        bText.visible = true
    }

    function setIconSource(s) {
        iconSource = s
        bText.visible = false
        icon.visible = true
    }

    function setPointSize(ps) {
        pointSize = ps
    }
}
