import QtQuick 2.0

Rectangle {
    id: mainRect
    radius: 5  // Rounded corners
    color: "#FF777777"

    property string buttonText: ""
    property int pointSize: 14
    property string iconSource: ""

    Text {
        id: bText
        anchors.centerIn: parent     // Center the text in the button
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        text: buttonText
        font.pointSize: pointSize
        wrapMode: Text.WordWrap

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
