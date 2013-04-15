import QtQuick 2.0
import ".."

Rectangle {
    id: root
    width: parent.width
    height: childrenRect.height
    radius: 5
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#222222" }
        //GradientStop { position: 0.5; color: "#444444" }
        GradientStop { position: 1.0; color: "#444444" }
    }

    property string time
    property string desc

    Rectangle {
        id: box
        height: 60
        width: height
        color: "#36c60f"
        border.width: 1
        radius: 5
        //anchors.verticalCenter: parent.verticalCenter

        Text {
            //height: 40
            //width: height
            text: time
            anchors.centerIn: parent
            style: Text.Sunken
            font.pixelSize: 20
        }
    }

    CommonText {
        anchors.left: box.right
        anchors.leftMargin: 5

        height: (lineCount+1) * font.pixelSize
        width: root.width
        text: desc
    }
}
