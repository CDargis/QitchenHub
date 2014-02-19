import QtQuick 2.0

Rectangle {

    // App starts in imperial, do a check to see if we are in different units
    Component.onCompleted: setUnits(theMainApplication.currentUnits)

    color: "transparent"
    border.color: "black"
    border.width: 1

    property string thermostatState: "Off"
    property string localUnits: "us"

    Rectangle {
        id: titleRect
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width; height: parent.height * (1/6)
        color: "transparent"
        Text {
            anchors.centerIn: parent
            font.family: fontFamily
            font.pointSize: 30
            color: "#36C60F"
            text: qsTr("Climate Control") + tr.emptyString
        }
    }
    // Get out of using columns and rows, the positioners suck
    Rectangle {
        id: currentTempRow
        width: parent.width; height: parent.height * (3/8)
        anchors.top: titleRect.bottom
        color: "transparent"
        Rectangle {
            width: parent.width; height: parent.height
            border.color: "black"
            border.width: 1
            color: "transparent"
            Image {
                id: currentTrendImage
                width: parent.width * .05; height: parent.width * .05
                anchors.right: currentTemp.left
                anchors.rightMargin: 100
                anchors.verticalCenter: currentTemp.verticalCenter
            }
            Text {
                id: currentTemp
                anchors.centerIn: parent
                font.family: fontFamily
                font.pixelSize: parent.width * (1/3)
                text: "68"
            }
            Text {
                id: degreeWhat
                anchors.left: currentTemp.right
                anchors.top: currentTemp.top
                anchors.topMargin: 30
                font.family: fontFamily
                font.pixelSize: parent.width * (1/10)
                text: "°F"
            }
        }
    }
    // Get out of using columns and rows, the positioners suck
    Rectangle {
        width: parent.width; height:parent.height - titleRect.height - currentTempRow.height
        anchors.top: currentTempRow.bottom
        color: "transparent"
        Rectangle {
            id: tempSetRect
            height: parent.height; width: parent.width /2
            color: "transparent"
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: setCurrentTemp.top
                anchors.bottomMargin: 30
                width: parent.width * (1/5); height: parent.width * (1/5)
                source: "qrc:/images/up-arrow-icon.png"
                Timer {
                    id: upTimer
                    interval: 200
                    repeat: true
                    running: false
                    onTriggered: upClick.increment()
                }
                MouseArea {
                    id: upClick
                    anchors.fill: parent
                    onPressAndHold: upTimer.running = true
                    onReleased: upTimer.running = false
                    onClicked: increment()
                    function increment() {
                        var temp = parseInt(setCurrentTemp.text)
                        setCurrentTemp.text = (temp + 1) + "°"
                    }
                }
            }
            Text {
                id: setCurrentTemp
                text: "68°"
                font.pixelSize: 40
                font.family: fontFamily
                anchors.centerIn: parent
                onTextChanged: {
                    var trend = getTrend()
                    if(trend === 1)
                        currentTrendImage.source = "qrc:/images/upArrow.png"
                    else if(trend === -1)
                        currentTrendImage.source = "qrc:/images/downArrow.png"
                    else
                        currentTrendImage.source = ""
                }
            }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: setCurrentTemp.bottom
                anchors.topMargin: 30
                width: parent.width * (1/5); height: parent.width * (1/5)
                source: "qrc:/images/down-arrow-icon.png"
                Timer {
                    id: downTimer
                    interval: 200
                    repeat: true
                    running: false
                    onTriggered: downClick.decrement()
                }
                MouseArea {
                    id: downClick
                    anchors.fill: parent
                    onPressAndHold: downTimer.running = true
                    onReleased: downTimer.running = false
                    onClicked: decrement()
                    function decrement() {
                        var temp = parseInt(setCurrentTemp.text)
                        setCurrentTemp.text = (temp - 1) + "°"
                    }
                }
            }
        }
        Rectangle {
            id: modeRect
            height: parent.height; width: parent.width /2
            color: "transparent"
            anchors.left: tempSetRect.right
            property string selectColor: "#44DDDDDD"
            Rectangle {
                id: coolRect
                height: parent.height * (1/4); width: parent.width * (1/4) + 10
                anchors.centerIn: parent
                radius: 20
                color: "transparent"
                Text {
                    font.family: fontFamily
                    font.pixelSize: 30
                    text: qsTr("Cool") + tr.emptyString
                    color: "#36C60F"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modeRect.deselectModes()
                        parent.color = modeRect.selectColor
                        thermostatState = "Cool"
                    }
                }
            }
            Rectangle {
                id: heatRect
                height: parent.height * (1/4); width: parent.width * (1/4) + 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: coolRect.top
                anchors.bottomMargin: 15
                radius: 20
                color: "transparent"
                Text {
                    font.family: fontFamily
                    font.pixelSize: 30
                    text: qsTr("Heat") + tr.emptyString
                    color: "#36C60F"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modeRect.deselectModes()
                        parent.color = modeRect.selectColor
                        thermostatState = "Heat"
                    }
                }
            }
            Rectangle {
                id: offRect
                height: parent.height * (1/4); width: parent.width * (1/4) + 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: coolRect.bottom
                anchors.topMargin: 15
                radius: 20
                color: modeRect.selectColor
                Text {
                    font.family: fontFamily
                    font.pixelSize: 30
                    text: qsTr("Off") + tr.emptyString
                    color: "#36C60F"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modeRect.deselectModes()
                        parent.color = modeRect.selectColor
                        thermostatState = "Off"
                    }
                }
            }
            function deselectModes() {
                coolRect.color = heatRect.color = offRect.color = "transparent"
            }
        }
    }

    // Function definitions ----------------------------------------------------

    function getTrend() {
        var current = parseInt(currentTemp.text)
        var target = parseInt(setCurrentTemp.text)
        if(current < target) return 1
        else if(current > target) return -1
        else if(current === target) return 0
    }

    function setUnits(units) {
        // Check to ensure we are actually changing units
        if(localUnits.localeCompare(units) === 0)
            return

        // Going from FH to celcius
        if(units.localeCompare("eu") === 0) {
            currentTemp.text = fHToCelcius(parseInt(currentTemp.text))
            setCurrentTemp.text = fHToCelcius(parseInt(setCurrentTemp.text)) + "°"
            degreeWhat.text = "°C"
            localUnits = "eu"
        }
        // going from celcius to FH
        if(units.localeCompare("us") === 0) {
            currentTemp.text = celciusToFH(parseInt(currentTemp.text))
            setCurrentTemp.text = celciusToFH(parseInt(setCurrentTemp.text)) + "°"
            degreeWhat.text = "°F"
            localUnits = "us"
        }
    }

    function getTemp() { return currentTemp.text }
}
