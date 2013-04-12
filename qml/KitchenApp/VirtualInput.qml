import QtQuick 2.0
import "VirtualKeyboard"

Rectangle {
    id: inputContainer
    border.color: "black"
    border.width: 1
    property string currentText
    property string fontSize: height * .75
    signal returnPressed(string theText) // Sends the current text with the signal

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
        font.pixelSize: fontSize
        selectByMouse: true
        autoScroll: true
        text: currentText
        clip: true
        onFocusChanged: {
            if(focus) {
                theKeyboard.showKeyboard(inputContainer)
            }
            else {

            }
        }
        // For keyboard input!
        onTextChanged: {
            currentText = text
        }
        onVisibleChanged: {
            if((!visible) && (theKeyboard)) {
                theKeyboard.hideKeyboard()
                theInput.focus = false
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
        currentText = result
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
        currentText = result
        theInput.cursorPosition = cursorPosition + 1
    }

    function handleBackspace() {
        var cursorPosition = theInput.cursorPosition
        var length = theInput.text.length
        var theText = theInput.text
        var result = ""
        result = theText.substring(0, cursorPosition - 1)
        result += theText.substring(cursorPosition, theText.length)
        currentText = result
        theInput.cursorPosition = cursorPosition - 1
    }

    function handleReturnKey(theText) {
        console.log(currentText)
        returnPressed(currentText)
        theInput.focus = false
        theKeyboard.hideKeyboard()
    }

    function handleClose() {
        theInput.focus = false
    }
}
