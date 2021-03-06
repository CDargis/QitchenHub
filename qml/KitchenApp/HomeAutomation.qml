<<<<<<< HEAD
import QtQuick 2.0

AppInterface {

    // Boom, bam, home automation widget
    widgetSrc: "HomeAutomationWidget.qml"

    Component.onCompleted: {
        languageChange(theMainApplication.language)  // Set the language
        security.unLock()
        speaker.say(qsTr("Home Automation"));
    }

    onLanguageChange: {
        statusBar.currentScreenTitle = qsTr("Home Automation") + tr.emptyString
    }

    onChangeUnits: temp.setUnits(units)  // Propagate that call

    anchors.fill: parent
    width: parent.width; height: parent.height

    Rectangle {
        anchors.fill: parent
        width: parent.width; height: parent.height
        color: "transparent"
        Rectangle {
            id: menuRect
            width: parent.width * (1/4)
            height: parent.height
            border.color: "black"
            border.width: 1
            color: "transparent"
            property int iconSide: width * .60
            property string selectColor: "#44DDDDDD"

            Rectangle {
                id: lightBulbRect
                anchors.top: parent.top
                width: parent.width; height: parent.height * (1/3)
                radius: 20
                color: menuRect.selectColor
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
                        parent.color = menuRect.selectColor
                        lights.visible = true
                    }
                }
            }
            Rectangle {
                id: tempRect
                anchors.verticalCenter: parent.verticalCenter
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
                        parent.color = menuRect.selectColor
                        temp.visible = true;
                    }
                }
            }
            Rectangle {
                id:securityRect
                anchors.bottom: parent.bottom
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
                        parent.color = menuRect.selectColor
                        security.visible = true
                    }
                }
            }
        }
        Lights {
            id: lights
            width: parent.width * (3/4)
            height: parent.height
            anchors.left: menuRect.right
            visible: true
        }
        Temperature {
            id: temp
            width: parent.width * (3/4)
            height: parent.height
            anchors.left: menuRect.right
            visible: false
        }
        Security {
            id: security
            width: parent.width * (3/4)
            height: parent.height
            anchors.left: menuRect.right
            visible: false
        }
    }

    // Function Definitions --------------------------------------------------------------

    function deselectMenu() {
        lightBulbRect.color = tempRect.color = securityRect.color = "transparent"
        lights.visible = temp.visible = security.visible = false;
    }

    function toggleSecurity() { security.toggle() }

    function getSecurityStatus() { return security.getSecurityStatus() }

    function getTempTrend() { return temp.getTrend() }

    function getThermostatState() { return temp.thermostatState }

    function getTemp() { return temp.getTemp() }

}
=======
import QtQuick 2.0

AppInterface {

    // Boom, bam, home automation widget
    widgetSrc: "HomeAutomationWidget.qml"

    Component.onCompleted: {
        languageChange(theMainApplication.language)  // Set the language
        speaker.say(qsTr("Home Automation"));
        security.unLock()
    }

    onLanguageChange: {
        statusBar.currentScreenTitle = qsTr("Home Automation") + tr.emptyString
    }

    onChangeUnits: temp.setUnits(units)  // Propagate that call

    anchors.fill: parent
    width: parent.width; height: parent.height

    Rectangle {
        anchors.fill: parent
        width: parent.width; height: parent.height
        color: "transparent"
        Rectangle {
            id: menuRect
            width: parent.width * (1/4)
            height: parent.height
            border.color: "black"
            border.width: 1
            color: "transparent"
            property int iconSide: width * .60
            property string selectColor: "#44DDDDDD"

            Rectangle {
                id: lightBulbRect
                anchors.top: parent.top
                width: parent.width; height: parent.height * (1/3)
                radius: 20
                color: menuRect.selectColor
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
                        parent.color = menuRect.selectColor
                        lights.visible = true
                    }
                }
            }
            Rectangle {
                id: tempRect
                anchors.verticalCenter: parent.verticalCenter
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
                        parent.color = menuRect.selectColor
                        temp.visible = true;
                    }
                }
            }
            Rectangle {
                id:securityRect
                anchors.bottom: parent.bottom
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
                        parent.color = menuRect.selectColor
                        security.visible = true
                    }
                }
            }
        }
        Lights {
            id: lights
            width: parent.width * (3/4)
            height: parent.height
            anchors.left: menuRect.right
            visible: true
            onVisibleChanged: {
                if(visible)
                    speaker.say("Lighting")
            }
        }
        Temperature {
            id: temp
            width: parent.width * (3/4)
            height: parent.height
            anchors.left: menuRect.right
            visible: false
            onVisibleChanged: {
                if(visible)
                    speaker.say("Climate Control")
            }
        }
        Security {
            id: security
            width: parent.width * (3/4)
            height: parent.height
            anchors.left: menuRect.right
            visible: false
            onVisibleChanged: {
                if(visible)
                    speaker.say("Home Security")
            }
        }
    }

    // Function Definitions --------------------------------------------------------------

    function deselectMenu() {
        lightBulbRect.color = tempRect.color = securityRect.color = "transparent"
        lights.visible = temp.visible = security.visible = false;
    }

    function toggleSecurity() { security.toggle() }

    function getSecurityStatus() { return security.getSecurityStatus() }

    function getTempTrend() { return temp.getTrend() }

    function getThermostatState() { return temp.thermostatState }

    function getTemp() { return temp.getTemp() }

}
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
