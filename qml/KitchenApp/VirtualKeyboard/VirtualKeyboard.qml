import QtQuick 2.0

Item {
    id: root
    anchors.fill: parent
    z: 0
    property int keyLength: 60  // Side of a key
    property bool shift: false
    property bool special: false
    property bool alt: false    // For special (Polish chars)

    // All bound to compoenents must handle the below signals!
    property var target: null     // Binding the keyboard to identifiers
    signal keyPress(string key)
    signal spacebar()
    signal backspace()
    signal returnKey()
    signal close()
    signal destroying()

    onKeyPress: {
        if(target !== null)
            target.handleKeyPress(key)
        // "Snap" the keyboard back into place
        theAltKey.snapBack()
        theSpecialKey.snapBack()
        row3.children[0].snapBack() // The shift key will be at the 0 index
    }

    onBackspace: {
        if(target !== null)
            target.handleBackspace()
    }

    onSpacebar: {
        if(target !== null)
            target.handleSpacebar()
    }

    onReturnKey: {
        if(target !== null)
            target.handleReturnKey()
    }

    onClose: {
        if(target !== null)
            target.handleClose()
        hideKeyboard()
    }

    onDestroying: {

    }


    onVisibleChanged: {

    }

    Component.onCompleted: buildTheKeyboard()

    Rectangle {
        anchors.fill: keyboardLayout
        color: "#77000000"
        // Rob mouse events so we don't hide when clicking in the keyboard
        MouseArea {
            anchors.fill: parent
        }
    }

    Image {
        id: closeButton
        height: keyLength; width: keyLength
        anchors.top: keyboardLayout.top
        anchors.right: keyboardLayout.right
        source: "qrc:/images/delete.png"
        MouseArea {
            anchors.fill: parent
            onClicked: close()
        }
    }

    Column {
        id: keyboardLayout
        spacing: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        width: parent.width
        Row {
            id: row1
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 6
        }
        Row {
            id: row2
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 6
        }
        Row {
            id: row3
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 6
        }
        Row {
            id: row4
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 6
            UniqueKey {
                id: theAltKey
                height: keyLength; width: keyLength * 1.4
                theText: "alt"
                boldOnChecked: true
                onCheckedChanged: {
                    root.alt = checked
                }
            }
            UniqueKey {
                id: theSpecialKey
                height: keyLength; width: keyLength * 1.4
                theText: "123?"
                boldOnChecked: true
                onCheckedChanged: {
                    root.special = checked
                }
            }
            UniqueKey {
                id: theSpaceBar
                height: keyLength; width: keyLength * 4
                theText: "|____________|"
                onPressed: spacebar()
            }
            UniqueKey {
                id: theReturnKey
                height: keyLength; width: keyLength * 1.4
                fontSize: 26
                theText: "⏎"
                onPressed: returnKey()
            }
        }
    }

    // Function definitions -------------------------------------------------------------

    function showKeyboard(theTarget) {
        target = theTarget
        root.visible = true
    }

    function hideKeyboard() {
        target = null
        root.visible = false
    }

    function createKeys(lowerChars, upperChars, special, altLower, altUpper, parent) {
        for(var i = 0; i < lowerChars.length; i++) {
            var component = Qt.createComponent("Key.qml");
            component.createObject(parent, {"height": keyLength, "width": keyLength, "lower": lowerChars[i]
                                       , "upper": upperChars[i], "special": special[i], "keyboard": root
                                       , "altLower":altLower[i], "altUpper": altUpper[i],  "fontSize": 30})
        }
    }

    function buildTheKeyboard() {
        console.log("building the keyboard...")
        createKeys(['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
                   ['Q', 'W', 'E', 'R', 'T', 'Y', 'Y', 'I', 'O', 'P'],
                   ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
                   ['' , '' , 'ę', '' , '' , '' , '' , '' , 'ó', '' ],
                   ['' , '' , 'Ę', '' , '' , '' , '' , '' , 'Ó', '' ], row1)
        createKeys(['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
                   ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
                   ['!', '@', '#', '$', '%', '&', '*', '(', ')'],
                   ['ą' , 'ś', '' , '' , '' , '' , '' , '', 'ł'],
                   ['Ą' , 'Ś', '' , '' , '' , '' , '' , '', 'Ł' ], row2)
        makeShiftKey()
        createKeys(['z', 'x', 'c', 'v', 'b', 'n', 'm'],
                   ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
                   [',', '.', '/', '\\', ':', ';', '?'],
                   ['ż', 'ź' ,'ć' , '' , '' , 'ń' , ''],
                   ['Ż', 'Ź' ,'Ć' , '' , '' , 'Ń' , ''], row3)
        makeBackspaceKey()
        console.log("...keyboard built")
    }

    function makeShiftKey() {
        var func = "function doIt() { keyboard.shift = checked }"
        var component = Qt.createComponent("UniqueKey.qml")
        component.createObject(row3, {"height": keyLength, "width": keyLength * 1.4, "keyboard": root,
                                   "functor": func, "fontSize": 30, "theText": "⬆", "boldOnChecked": true})
    }

    function makeBackspaceKey() {
        var func = "function doIt() { keyboard.backspace() }"
        var component = Qt.createComponent("UniqueKey.qml")
        component.createObject(row3, {"height": keyLength, "width": keyLength * 1.4, "keyboard": root,
                                   "functor": func, "fontSize": 26, "theText": "⬅"})
    }

    function killTheKeyboard() {
        root.destroying()
        root.destroy()
    }
}
