import QtQuick 2.0

Item {
    id: root
    width: 100
    height: 100

    property int xMargin: 10
    property int yMargin: 10

    PathInterpolator {
        id: sq1

        path: Path {
            startX: xMargin; startY: 0

            PathCurve { x: 2 * xMargin; y: yMargin }
            PathCurve { x: xMargin; y: 2 * yMargin }
            PathCurve { x: 0; y: yMargin }
            PathCurve { x: xMargin; y: 0 }


        }

        NumberAnimation on progress { from: 0; to: 1; duration: 1000; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: sq2

        path: Path {
            startX: 2 * xMargin; startY: yMargin

            PathCurve { x: xMargin; y: 2 * yMargin }
            PathCurve { x: 0; y: yMargin }
            PathCurve { x: xMargin; y: 0 }
            PathCurve { x: 2 * xMargin; y: yMargin }


        }

        NumberAnimation on progress { from: 0; to: 1; duration: 1000; loops: Animation.Infinite}
    }

    PathInterpolator {
        id: sq3

        path: Path {
            startX: xMargin; startY: 2 * yMargin

            PathCurve { x: 0; y: yMargin }
            PathCurve { x: xMargin; y: 0 }
            PathCurve { x: 2 * xMargin; y: yMargin }
            PathCurve { x: xMargin; y: 2 * yMargin }
        }

        NumberAnimation on progress { from: 0; to: 1; duration: 1000; loops: Animation.Infinite}
    }

    Rectangle {
        color: "#35c20e"
        opacity: 0.5
        radius: root.width * 0.5

        //bind our attributes to follow the path as progress changes
        x: sq1.x
        y: sq1.y
        width: root.width - 2 * sq1.x
        height: root.height - 2 * sq1.y
    }

    Rectangle {
        color: "#35c20e"
        opacity: 0.5
        radius: root.height * 0.5

        //bind our attributes to follow the path as progress changes
        x: sq2.x
        y: sq2.y
        width: root.width - 2 * sq2.x
        height: root.height - 2 * sq2.y
    }

    Rectangle {
        color: "#35c20e"
        opacity: 0.5
        radius: root.height * 0.5

        //bind our attributes to follow the path as progress changes
        x: sq3.x
        y: sq3.y
        width: root.width - 2 * sq3.x
        height: root.height - 2 * sq3.y
    }
}
