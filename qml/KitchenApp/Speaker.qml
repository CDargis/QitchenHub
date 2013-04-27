import QtQuick 2.0
import TTSVoice 1.0

Item {
    id: root
    width: 300
    height: 100

    property int xSpacing: width / 8
    property int ySpacing: height / 5

    property int maxY: root.height - ySpacing
    property int travelLength: root.height - 2 * ySpacing

    Voice {
        id: voice

        onFinished: {
            root.state = "IDLE";
        }
    }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            if (root.state == "")
                root.state = "IDLE";
            else
                root.state = "";
        }
    }

    PathInterpolator {
        id: p1

        path: Path {
            startX: xSpacing; startY: ySpacing + travelLength * 0.75

            PathLine { x: xSpacing; y: root.height - ySpacing }
            PathLine { x: xSpacing; y: ySpacing }
            PathLine { x: xSpacing; y: ySpacing + travelLength * 0.75 }

        }

        NumberAnimation on progress { from: 0; to: 1; duration: 500; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: p2

        path: Path {
            startX: xSpacing * 2; startY: root.height - ySpacing

            PathLine { x: xSpacing * 2; y: ySpacing }
            PathLine { x: xSpacing * 2; y: root.height - ySpacing }
        }

        NumberAnimation on progress { from: 0; to: 1; duration: 500; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: p3

        path: Path {
            startX: xSpacing * 3; startY: ySpacing + travelLength * 0.75

            PathLine { x: xSpacing * 3; y: ySpacing }
            PathLine { x: xSpacing * 3; y: root.height - ySpacing }
            PathLine { x: xSpacing * 3; y: ySpacing + travelLength * 0.75 }

        }

        NumberAnimation on progress { from: 0; to: 1; duration: 500; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: p4

        path: Path {
            startX: xSpacing * 4; startY: root.height * 0.5

            PathLine { x: xSpacing * 4; y: ySpacing }
            PathLine { x: xSpacing * 4; y: root.height - ySpacing }
            PathLine { x: xSpacing * 4; y: root.height * 0.5 }

        }

        NumberAnimation on progress { from: 0; to: 1; duration: 500; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: p5

        path: Path {
            startX: xSpacing * 5; startY: ySpacing + travelLength * 0.25

            PathLine { x: xSpacing * 5; y: ySpacing }
            PathLine { x: xSpacing * 5; y: root.height - ySpacing }
            PathLine { x: xSpacing * 5; y: ySpacing + travelLength * 0.25 }

        }

        NumberAnimation on progress { from: 0; to: 1; duration: 500; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: p6

        path: Path {
            startX: xSpacing * 6; startY: ySpacing

            PathLine { x: xSpacing * 6; y: root.height - ySpacing }
            PathLine { x: xSpacing * 6; y: ySpacing }

        }

        NumberAnimation on progress { from: 0; to: 1; duration: 500; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: p7

        path: Path {
            startX: xSpacing * 7; startY: ySpacing + travelLength * 0.25

            PathLine { x: xSpacing * 7; y: root.height - ySpacing }
            PathLine { x: xSpacing * 7; y: ySpacing }
            PathLine { x: xSpacing * 7; y: ySpacing + travelLength * 0.25 }

        }

        NumberAnimation on progress { from: 0; to: 1; duration: 500; loops: Animation.Infinite}
    }

    Image {
        id: c1
        source: "qrc:/images/circle1.png"
        width: ySpacing
        height: width
        x: p1.x - width * 0.5
        y: p1.y - height * 0.5
    }

    Image {
        id: c2
        source: "qrc:/images/circle2.png"
        width: 1.5 * ySpacing
        height: width
        x: p2.x - width * 0.5
        y: p2.y - height * 0.5
    }

    Image {
        id: c3
        source: "qrc:/images/circle3.png"
        width: 2 * ySpacing
        height: width
        x: p3.x - width * 0.5
        y: p3.y - height * 0.5
    }

    Image {
        id: c4
        source: "qrc:/images/circle4.png"
        width: 1.25 * ySpacing
        height: width
        x: p4.x - width * 0.5
        y: p4.y - height * 0.5
    }

    Image {
        id: c5
        source: "qrc:/images/circle2.png"
        width: 1.5 * ySpacing
        height: width
        x: p5.x - width * 0.5
        y: p5.y - height * 0.5
    }

    Image {
        id: c6
        source: "qrc:/images/circle1.png"
        width: 1.75 * ySpacing
        height: width
        x: p6.x - width * 0.5
        y: p6.y - height * 0.5
    }

    Image {
        id: c7
        source: "qrc:/images/circle3.png"
        width: ySpacing
        height: width
        x: p7.x - width * 0.5
        y: p7.y - height * 0.5
    }




    states: [
        State {
            name: "IDLE"
            when: root.state == "IDLE"
            PropertyChanges {
                target: c1
                y: ySpacing + travelLength * 0.5 - c1.height * 0.5
            }
            PropertyChanges {
                target: c2
                y: ySpacing + travelLength * 0.75 - c2.height * 0.5
            }
            PropertyChanges {
                target: c3
                y: ySpacing + travelLength * 0.9 - c3.height * 0.5
            }
            PropertyChanges {
                target: c4
                y: ySpacing + travelLength - c4.height * 0.5
            }
            PropertyChanges {
                target: c5
                y: ySpacing + travelLength * 0.9 - c5.height * 0.5
            }
            PropertyChanges {
                target: c6
                y: ySpacing + travelLength * 0.75 - c6.height * 0.5
            }
            PropertyChanges {
                target: c7
                y: ySpacing + travelLength * 0.5 - c7.height * 0.5
            }
        }
    ]

    transitions: [
        Transition {
            from: "IDLE"
            to: ""
            NumberAnimation {
                target: c1
                property: "y"
                duration: 400
                easing.type: Easing.InCubic
            }
            NumberAnimation {
                target: c2
                property: "y"
                duration: 400
                easing.type: Easing.InCubic
            }
            NumberAnimation {
                target: c3
                property: "y"
                duration: 400
                easing.type: Easing.InCubic
            }
            NumberAnimation {
                target: c4
                property: "y"
                duration: 400
                easing.type: Easing.InCubic
            }
            NumberAnimation {
                target: c5
                property: "y"
                duration: 400
                easing.type: Easing.InCubic
            }
            NumberAnimation {
                target: c6
                property: "y"
                duration: 400
                easing.type: Easing.InCubic
            }
            NumberAnimation {
                target: c7
                property: "y"
                duration: 400
                easing.type: Easing.InCubic
            }

        },
        Transition {
            from: ""
            to: "IDLE"
            NumberAnimation {
                target: c1
                property: "y"
                duration: 600
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: c2
                property: "y"
                duration: 600
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: c3
                property: "y"
                duration: 600
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: c4
                property: "y"
                duration: 600
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: c5
                property: "y"
                duration: 600
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: c6
                property: "y"
                duration: 600
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: c7
                property: "y"
                duration: 600
                easing.type: Easing.OutCubic
            }

        }
    ]

    Component.onCompleted: {
    }


    function say(string) {
        if (theMainApplication.voiceOn) {
            voice.say(string);
            root.state = "";
        }
    }
}
