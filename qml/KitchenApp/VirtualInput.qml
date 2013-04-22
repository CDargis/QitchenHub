import QtQuick 2.0
import "VirtualKeyboard"

Rectangle {
    id: inputContainer
    width: 150; height: 50
    border.color: "black"
    border.width: 1
    property string currentText
    property int fontSize: 18
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

    Flickable {
        id: flick
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick
        contentWidth: theInput.width; contentHeight: theInput.height
        clip: true
        function ensureVisible(r)
        {
            if (contentY >= r.y)
                contentY = r.y;
            else if (contentY+height <= r.y+r.height)
                contentY = r.y + r.height-height;
        }
        TextInput {
            id: theInput
            width: inputContainer.width
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.family: fontFamily
            font.pixelSize: fontSize
            selectByMouse: true
            text: currentText
            clip: true
            wrapMode: Text.Wrap
            onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
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

    function forceFocus() {
        theInput.focus = true
    }
}
