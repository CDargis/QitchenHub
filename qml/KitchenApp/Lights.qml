import QtQuick 2.0

Rectangle {
    id: lights
    color: "transparent"
    border.color: "black"
    border.width: 1
    Rectangle {
        anchors.bottom: lightingCol.top
        anchors.bottomMargin: 55
        width: parent.width; height: 50
        color: "transparent"
        Text {
            anchors.centerIn: parent
            font.family: fontFamily
            font.pointSize: 30
            text: "Lighting"
        }
    }
    Column {
        id: lightingCol
        spacing: 10
        anchors.centerIn: parent
        Row {
            id: kitchenLights
            spacing: 10
            Rectangle {
                id: kitchenRect
                width: lights.width / 3; height: 50
                border.color: "black"
                border.width: 1
                color: "#FFEAFF00" // All the way up
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pointSize: 14
                    text: "Kitchen"
                }
            }
            Rectangle {
                width: lights.width / 3; height: 50
                color: "transparent"
                Slider {
                    anchors.centerIn: parent
                    sliderWidth: parent.width * .9
                    sliderHeight: parent.height * .5
                    maximum: 15
                    value: 15
                    onValueChanged: {
                        var hex = parseInt(value).toString(16)  // Get the hex code
                        kitchenRect.color = "#" + hex + hex + "EAFF00" // Adjust the alpha channel
                    }
                }
            }
        }
        Row {
            id: livingRoomLights
            spacing: 10
            Rectangle {
                id: livingRoomRect
                width: lights.width / 3; height: 50
                border.color: "black"
                border.width: 1
                color: "#FFEAFF00" // All the way up
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pointSize: 14
                    text: "Living Room"
                }
            }
            Rectangle {
                width: lights.width / 3; height: 50
                color: "transparent"
                Slider {
                    anchors.centerIn: parent
                    sliderWidth: parent.width * .9;
                    sliderHeight: parent.height * .5;
                    maximum: 15
                    value: 15
                    onValueChanged: {
                        var hex = parseInt(value).toString(16)  // Get the hex code
                        livingRoomRect.color = "#" + hex + hex + "EAFF00" // Adjust the alpha channel
                    }
                }
            }
        }
        Row {
            id: familyRoomLights
            spacing: 10
            Rectangle {
                id: familyRoomRect
                width: lights.width / 3; height: 50
                border.color: "black"
                border.width: 1
                color: "#FFEAFF00" // All the way up
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pointSize: 14
                    text: "Family Room"
                }
            }
            Rectangle {
                width: lights.width / 3; height: 50
                color: "transparent"
                Slider {
                    anchors.centerIn: parent
                    sliderWidth: parent.width * .9;
                    sliderHeight: parent.height * .5;
                    maximum: 15
                    value: 15
                    onValueChanged: {
                        var hex = parseInt(value).toString(16)  // Get the hex code
                        familyRoomRect.color = "#" + hex + hex + "EAFF00" // Adjust the alpha channel
                    }
                }
            }
        }
        Row {
            id: frontHallway
            spacing: 10
            Rectangle {
                id: frontHallwayRect
                width: lights.width / 3; height: 50
                border.color: "black"
                border.width: 1
                color: "#FFEAFF00" // All the way up
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pointSize: 14
                    text: "Front Hallway"
                }
            }
            Rectangle {
                width: lights.width / 3; height: 50
                color: "transparent"
                Slider {
                    anchors.centerIn: parent
                    sliderWidth: parent.width * .9;
                    sliderHeight: parent.height * .5;
                    maximum: 15
                    value: 15
                    onValueChanged: {
                        var hex = parseInt(value).toString(16)  // Get the hex code
                        frontHallwayRect.color = "#" + hex + hex + "EAFF00" // Adjust the alpha channel
                    }
                }
            }
        }
        Row {
            id: officeLights
            spacing: 10
            Rectangle {
                id: officeRect
                width: lights.width / 3; height: 50
                border.color: "black"
                border.width: 1
                color: "#FFEAFF00" // All the way up
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pointSize: 14
                    text: "Office"
                }
            }
            Rectangle {
                width: lights.width / 3; height: 50
                color: "transparent"
                Slider {
                    anchors.centerIn: parent
                    sliderWidth: parent.width * .9;
                    sliderHeight: parent.height * .5;
                    maximum: 15
                    value: 15
                    onValueChanged: {
                        var hex = parseInt(value).toString(16)  // Get the hex code
                        officeRect.color = "#" + hex + hex + "EAFF00" // Adjust the alpha channel
                    }
                }
            }
        }
        Row {
            id: garage
            spacing: 10
            Rectangle {
                id: garageRect
                width: lights.width / 3; height: 50
                border.color: "black"
                border.width: 1
                color: "#FFEAFF00" // All the way up
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pointSize: 14
                    text: "Garage"
                }
            }
            Rectangle {
                width: lights.width / 3; height: 50
                color: "transparent"
                Slider {
                    anchors.centerIn: parent
                    sliderWidth: parent.width * .9;
                    sliderHeight: parent.height * .5;
                    maximum: 15
                    value: 15
                    onValueChanged: {
                        var hex = parseInt(value).toString(16)  // Get the hex code
                        garageRect.color = "#" + hex + hex + "EAFF00" // Adjust the alpha channel
                    }
                }
            }
        }
    }
}
