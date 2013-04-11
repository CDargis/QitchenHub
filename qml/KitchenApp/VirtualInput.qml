import QtQuick 2.0
import "VirtualKeyboard"

Rectangle {
    id: containingRect
    border.color: "black"
    border.width: 1
    property string inputText: ""

    MouseArea {
        anchors.fill: parent
        onClicked: {
            theInput.focus = true
            theInput.cursorPosition = theInput.text.length
        }
    }

    TextInput {
        id: theInput
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.family: fontFamily
        font.pixelSize: parent.height * .7
        selectByMouse: true
        text: inputText
        onFocusChanged: {
            if(focus) {
                theKeyboard.visible = true
            }
            else {
                theKeyboard.visible = false
            }
        }
    }

    VirtualKeyboard {
        id: theKeyboard
        parent: theMainApplication    // Explicitly set to fill the screen
        visible: false
        onVisibleChanged: {
            if(visible)
                theInput.cursorVisible = true
            else theInput.cursorVisible = false
        }
        onClose: theInput.focus = false
    }
}
