import QtQuick 2.0

Rectangle {
    id: containingRect
    border.color: "black"
    border.width: 1
    property string inputText: ""

    MouseArea {
        anchors.fill: parent
        onClicked: {
            nameInput.focus = true
        }
    }

    TextInput {
        id: nameInput
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.family: fontFamily
        font.pixelSize: parent.height * .7
        selectByMouse: true
        text: inputText
        onFocusChanged: {
            console.log("hey")
        }
    }
}
