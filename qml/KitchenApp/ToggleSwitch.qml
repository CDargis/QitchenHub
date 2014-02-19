import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {

    id: theSwitch
    width: 105
    height: 40
    radius: 35

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#36C60F" }
        GradientStop { position: 1.0; color: "#2B950A" }
    }

    property string onText: qsTr("ON") + tr.emptyString
    property string offText: qsTr("OFF") + tr.emptyString
    property bool isOn: true
    onIsOnChanged: {
        if(isOn)
            turnItOn()
        else turnItOff()
    }

    // Define the switch
    Rectangle {
        id: knob
        height: parent.height; width: parent.height
        anchors.right: parent.right
        radius: 35
        border.width: 1     // Masking off the bad blending job Qt does
        border.color: "gray"
        ConicalGradient {
            anchors.fill: parent
            angle: 0.0
            source: knob
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightgray" }
                GradientStop { position: .25; color: "gray" }
                GradientStop { position: .5; color: "lightgray" }
                GradientStop { position: .75; color: "gray" }
                GradientStop { position: 1.0; color: "lightgray" }
            }
        }
    }
    Text {
        id: isOnText
        anchors.verticalCenter: parent.verticalCenter
        x: (theSwitch.width - knob.width) / 2 - (width / 2)
        font.family: fontFamily
        font.pixelSize: parent.height * .55
        font.bold: true
        text: onText
        color: "#36C60F"
    }
    InnerShadow {
        id: isOnShadow
        anchors.fill: isOnText
        radius: 16
        samples: 16
        color: "black"
        source: isOnText
    }
    Text {
        id: isOffText
        anchors.verticalCenter: parent.verticalCenter
        x: (theSwitch.width + knob.width) / 2 - (width / 2)
        font.family: fontFamily
        font.pixelSize: parent.height * .55
        font.bold: true
        text: offText
        visible: false
        color: "#36C60F"
    }
    InnerShadow {
        id: isOffShadow
        anchors.fill: isOffText
        radius: 16
        samples: 16
        color: "black"
        source: isOffText
        visible: false
    }
    MouseArea {
        anchors.fill: parent
        onClicked: isOn = !isOn
    }

    // Function definitions ---------------------------------------------

    function turnItOn() {
        knob.anchors.left = undefined
        isOnText.visible = true
        isOnShadow.visible = true
        isOffText.visible = false
        isOffShadow.visible = false
        knob.anchors.right = theSwitch.right
    }

    function turnItOff() {
        knob.anchors.right = undefined
        isOnText.visible = false
        isOnShadow.visible = false
        isOffText.visible = true
        isOffShadow.visible = true
        knob.anchors.left = theSwitch.left
    }
}
