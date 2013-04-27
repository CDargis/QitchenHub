import QtQuick 2.0

WidgetInterface {

    // Timer for refreshing
    Timer {
        id: tempRefresh
        repeat: true
        running: true
        interval: 1000
        onTriggered: loadUI()
    }

    Component.onCompleted: loadUI()


    width: parent.width
    height: 300

    Rectangle {
        radius: 10
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#222222" }
            GradientStop { position: 1.0; color: "#444444" }
        }

        Text {
            id: temp
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: fontFamily
            font.pixelSize: parent.width * .35
            color: "white"
        }
        Text {
            anchors.left: temp.right
            font.family: fontFamily
            font.pixelSize: parent.width * .3
            text: "°"
            color: "white"
        }
        Rectangle {
            id: topSep
            width:parent.width * .85; height: 1
            color: "#36C60F"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: temp.bottom
            anchors.topMargin: 5
        }
        Text {
            id: cool
            anchors.top: topSep.bottom
            anchors.topMargin: 15
            anchors.horizontalCenter: temp.horizontalCenter
            font.family: fontFamily
            font.pixelSize:  temp.font.pixelSize * (1/5)
            text: qsTr("Cool") + tr.emptyString
            color: "white"
        }
        Text {
            id: heat
            anchors.top: cool.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: temp.horizontalCenter
            font.family: fontFamily
            font.pixelSize: temp.font.pixelSize * (1/5)
            text: qsTr("Heat") + tr.emptyString
            color: "white"
        }
        Text {
            id: off
            anchors.top: heat.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: temp.horizontalCenter
            font.family: fontFamily
            font.pixelSize: temp.font.pixelSize * (1/5)
            text: qsTr("Off") + tr.emptyString
            color: "white"
        }
        // Trend image
        Image {
            id: trendImg
            anchors.right: temp.left
            anchors.rightMargin: 20
            anchors.verticalCenter: temp.verticalCenter
            width: parent.width * .05; height: parent.width * .05
        }
        // Black line
        Rectangle {
            id: bottomSep
            width:parent.width * .85; height: 1
            color: "#36C60F"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: off.bottom
            anchors.topMargin: 15
        }
        Rectangle {
            id: securityStatusRect
            width: parent.width * .65; height: parent.height * .2
            y: bottomSep.y + (((parent.height - bottomSep.y) / 2) - height/2)
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            color: "transparent"
            Text {
                id: seucrityStatusText
                anchors.centerIn: parent
                font.family: fontFamily
                font.pixelSize: parent.height * .35
                text: qsTr("Unarmed") + tr.emptyString
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.toggleSecurity()
                }
            }
        }
    }

    // Function definitions

    function loadUI() {
        temp.text = app.getTemp()
        setThermostat()
        setSecurity()
    }

    function setThermostat() {
        var thermostatState = app.getThermostatState()
        if(thermostatState === "Heat") {
            heat.font.bold = true
            cool.font.bold = false
            off.font.bold = false
            heat.font.underline = true
            cool.font.underline = false
            off.font.bold = false
        }
        else if(thermostatState === "Cool") {
            cool.font.bold = true
            off.font.bold = false
            heat.font.bold = false
            heat.font.underline = false
            cool.font.underline = true
            off.font.bold = false
        }
        else if(thermostatState === "Off") {
            off.font.bold = true
            cool.font.bold = false
            heat.font.bold = false
            heat.font.underline = false
            cool.font.underline = false
            off.font.underline = true
        }
        switch(app.getTempTrend()) {
        case 1: trendImg.source = "qrc:/images/upArrow_white.png"; break;
        case -1: trendImg.source = "qrc:/images/downArrow_white.png"; break;
        default: trendImg.source = ""
        }
    }

    function setSecurity() {
        // If locked
        if(app.getSecurityStatus() === true) {
            securityStatusRect.color = "#AA2CFF14"
            seucrityStatusText.text = qsTr("Locked") + tr.emptyString
        }
        else {
            securityStatusRect.color = "#AAFF0000"
            seucrityStatusText.text = qsTr("Unlocked") + tr.emptyString
        }
    }
}
