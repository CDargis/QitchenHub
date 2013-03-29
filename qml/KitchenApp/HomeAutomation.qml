import QtQuick 2.0

AppInterface {
    Component.onCompleted: statusBar.setCurrentScreenTitle("Home Automation")
    anchors.fill: parent
    width: parent.width; height: parent.height
    Rectangle {
        anchors.fill: parent
        width: parent.width; height: parent.height
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#18C4B3" }
            GradientStop { position: 1.0; color: "#6E6E6E" }
        }
        Rectangle {
            id: menuRect
            width: parent.width * (1/3)
            height: parent.height
            border.color: "black"
            border.width: 1
            color: "transparent"
            property int iconSide: width * .50
            Column {
                width: parent.width; height: parent.height
                Rectangle {
                    id: lightBulbRect
                    width: parent.width; height: parent.height * (1/3)
                    radius: 20
                    color: "#99EEEEEE"
                    Image {
                        height: menuRect.iconSide
                        width: menuRect.iconSide
                        anchors.centerIn: parent
                        source: "qrc:/images/lightBulb.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            deselectMenu()
                            parent.color = "#99EEEEEE"
                            lightsContainer.visible = true
                        }
                    }
                }
                Rectangle {
                    id: tempRect
                    width: parent.width; height: parent.height * (1/3)
                    radius: 20
                    color: "transparent"
                    Image {
                        height: menuRect.iconSide
                        width: menuRect.iconSide
                        anchors.centerIn: parent
                        source: "qrc:/images/Temperature-256.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            deselectMenu()
                            parent.color = "#99EEEEEE"
                            tempContainer.visible = true;
                        }
                    }
                }
                Rectangle {
                    id:securityRect
                    width: parent.width; height: parent.height * (1/3)
                    radius: 20
                    color: "transparent"
                    Image {
                        height: menuRect.iconSide
                        width: menuRect.iconSide
                        anchors.centerIn: parent
                        source: "qrc:/images/security.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            deselectMenu()
                            parent.color = "#99EEEEEE"
                            securityContainer.visible = true
                        }
                    }
                }
            }
        }
        Lights {
            id: lightsContainer
            width: parent.width * (2 /3)
            height: parent.height
            anchors.left: menuRect.right
            visible: true
        }
        Temperature {
            id: tempContainer
            width: parent.width * (2 /3)
            height: parent.height
            anchors.left: menuRect.right
            visible: false
        }
        Security {
            id: securityContainer
            width: parent.width * (2 /3)
            height: parent.height
            anchors.left: menuRect.right
            visible: false
        }
    }

    // Function Definitions --------------------------------------------------------------

    function deselectMenu() {
        lightBulbRect.color = tempRect.color = securityRect.color = "transparent"
        lightsContainer.visible = tempContainer.visible = securityContainer.visible = false;
    }
}
