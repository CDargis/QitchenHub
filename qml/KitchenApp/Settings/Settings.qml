import QtQuick 2.0

Rectangle {
    anchors.centerIn: parent
    border.color: "#36C60F"
    border.width: 2
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#7b7b85" }
        GradientStop { position: 1.0; color: "#26242a" }
    }

    // Rob any mouse events
    MouseArea {
        anchors.fill: parent
    }

    LanguageSelect {
        id: langSelect
        height: parent.height; width: parent.width / 3
    }
    Rectangle {
        id: div12
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: langSelect.right
        width: 1; height: parent.height * .90
        color: "#36C60F"
    }
    // Middle col placeholder
    Rectangle {
        id: unitSelect
        anchors.left: div12.right
        height: parent.height; width: parent.width / 3
        color: "transparent"
    }
    Rectangle {
        id: div23
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: unitSelect.right
        width: 1; height: parent.height * .90
        color: "#36C60F"
    }
    // Last col placeholder
    Rectangle {
        id: lastcol
        anchors.left: div23.right
        height: parent.height; width: parent.width / 3
        color: "transparent"
    }
}
