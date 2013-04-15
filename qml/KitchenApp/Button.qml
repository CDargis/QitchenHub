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
    signal buttonClick()

    MouseArea {
        anchors.fill: parent
        onClicked: buttonClick()
    }


    Image {
        id: icon
        anchors.verticalCenter: parent.verticalCenter   // Center the picture in the button
        anchors.right: bText.left;
        source: iconSource
        height: parent.height * 0.5; width: height  // Constrain the image
    }

    Text {
        id: bText
        anchors.centerIn: parent     // Center the text in the button
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        text: buttonText
        font.pointSize: pointSize
        wrapMode: Text.WordWrap


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
