import QtQuick 2.0
import "VirtualKeyboard"

Rectangle {
    id: inputContainer
    border.color: "black"
    border.width: 1
    property string inputText: ""

    MouseArea {
        anchors.fill: parent
        onClicked: {
            theInput.focus = true
            theInput.cursorPosition = theInput.text.length
        }
        onDoubleClicked: {
            theInput.focus = true
            theInput.selectAll()
        }
    }

    TextInput {
        id: theInput
        anchors.centerIn: parent
        height: inputContainer.height; width: inputContainer.width
        font.family: fontFamily
        font.pixelSize: height * .75
        selectByMouse: true
        autoScroll: true
        clip: true
        text: inputText
        onFocusChanged: {
            if(focus) {
                theKeyboard.showKeyboard(inputContainer)
            }
            else {

            }
        }
    }

    // Function definitions ------------------------------------------------------

    function handleKeyPress(key) {
        var cursorPosition = theInput.cursorPosition
        var i
        var result = ""
        for(i = 0; i < cursorPosition; i++) {
            result += theInput.text.charAt(i)
        }
        result += key
        for(i = cursorPosition; i < theInput.text.length; i++)
            result += theInput.text.charAt(i)
        theInput.text = result
        theInput.cursorPosition = cursorPosition + 1
    }

    function handleSpacebar() {
        var cursorPosition = theInput.cursorPosition
        var i
        var result = ""
        for(i = 0; i < cursorPosition; i++) {
            result += theInput.text.charAt(i)
        }
        result += " "
        for(i = cursorPosition; i < theInput.text.length; i++)
            result += theInput.text.charAt(i)
        theInput.text = result
        theInput.cursorPosition = cursorPosition + 1
    }

    function handleBackspace() {
        var cursorPosition = theInput.cursorPosition
        var length = theInput.text.length
        var theText = theInput.text
        var result = ""
        result = theText.substring(0, cursorPosition - 1)
        result += theText.substring(cursorPosition, theText.length)
        theInput.text = result
        theInput.cursorPosition = cursorPosition - 1
    }

    function handleReturnKey() {
        console.log("return key")
    }

    function handleClose() {
        theInput.focus = false
    }
}
