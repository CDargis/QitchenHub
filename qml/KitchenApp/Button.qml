import QtQuick 2.0

Rectangle {
    id: mainRect
    radius: 5  // Rounded corners
    color: "#777777"

    property string buttonText: ""
    property int pointSize: 14
    property string iconSource: ""

    Text {
        id: bText
        anchors.centerIn: parent
        text: buttonText
        font.pointSize: pointSize
    }
    Image {
        id: icon
        anchors.centerIn: parent
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
