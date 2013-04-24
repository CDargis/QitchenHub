import QtQuick 2.0
import "../"

Item {
    id: root
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        Image {
            id: image
            height: 35; width: 35
            source: "qrc:/images/expand.png"
            MouseArea {
                anchors.fill: parent
                onClicked: vInput.returnPressed(vInput.currentText)
            }
        }
        VirtualInput {
            id: vInput
            anchors.left: image.right
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            height: 35; width: parent.width - image.width - 10
            fontSize: 16
            currentText: "Enter artists here..."

            onReturnPressed: {
                if(currentText !== "Enter artists here...") {
                    root.parent.parent.parent.inputAddingItem(currentText)
                    currentText = ""
                }
            }

            onKeyboardIsVisible: {
                if(currentText === "Enter artists here...")
                    currentText = ""
            }
        }
    }
}

