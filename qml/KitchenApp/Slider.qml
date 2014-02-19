import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: slider; width: sliderWidth; height: sliderHeight;

    // value is read/write.
    property int sliderWidth: 50;
    property int sliderHeight: 10;
    property real value: 1
    property bool canDrag: true
    property bool showProgress: true
    onValueChanged: updatePos();
    property real maximum: 1
    property real minimum: 1
    property int xMax: width - handle.width - 4
    onXMaxChanged: updatePos();
    onMinimumChanged: updatePos();
    property bool enabled: true
    onEnabledChanged: {
        if(enabled)
            opacity = .4
        else opacity = 1
        canDrag = !enabled
    }

    function updatePos() {
        if (maximum > minimum) {
            var pos = 2 + (value - minimum) * slider.xMax / (maximum - minimum);
            pos = Math.min(pos, width - handle.width - 2);
            pos = Math.max(pos, 2);
            handle.x = pos;
        } else {
            handle.x = 2;
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        border.color: "white"; border.width: 0; radius: 8
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#66343434" }
            GradientStop { position: 1.0; color: "#66000000" }
        }
    }
    // Progress rect
    Rectangle {
        anchors.verticalCenter: background.verticalCenter
        visible: showProgress
        radius: 8
        height: background.height
        width: handle.x + (handle.width / 2)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#36C60F" }
            GradientStop { position: 1.0; color: "#2B950A" }
        }
    }

    Rectangle{
        id: handle; smooth: true
        anchors.verticalCenter: slider.verticalCenter
        width: slider.height * 2.5; height: slider.height * 2.5;
        radius: 50
        border.width: 1     // Masking off the bad blending job Qt does
        border.color: "gray"
        ConicalGradient {
            anchors.fill: parent
            angle: 0.0
            source: handle
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightgray" }
                GradientStop { position: .25; color: "gray" }
                GradientStop { position: .5; color: "lightgray" }
                GradientStop { position: .75; color: "gray" }
                GradientStop { position: 1.0; color: "lightgray" }
            }
        }
        MouseArea {
            id: mouse
            anchors.fill: parent; drag.target: parent
            drag.axis: (canDrag) ? Drag.XAxis : Drag.YAxis; drag.minimumX: 2; drag.maximumX: slider.xMax+2
            onPositionChanged: { value = (maximum - minimum) * (handle.x-2) / slider.xMax + minimum; }
        }
    }
}
