import QtQuick 2.0

Item {
    id: root
    property string name
    property bool checked: false
    Rectangle {
        anchors.fill: parent
        color: (root.checked) ? "red" : "transparent"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.checked = !root.checked
            }
        }
        Image {
            id: image
            height: 35; width: 35
            source: (root.checked) ? "qrc:/images/delete.png" : "qrc:/images/collapse.png"
            MouseArea {
                id: killArea
                anchors.fill: parent
                onClicked: {
                    if(root.checked) {
                        root.parent.parent.parent.destroyingItem(root)
                        root.destroy()
                    }
                    else root.checked = true
                }
            }
        }
        Text {
            id: nameText
            text: name
            anchors.left: image.right
            anchors.leftMargin: 10
            anchors.verticalCenter: image.verticalCenter
            width: parent.width - image.width - 10
            font.family: fontFamily
            font.pixelSize: 12
            wrapMode: Text.Wrap
        }
    }
}
