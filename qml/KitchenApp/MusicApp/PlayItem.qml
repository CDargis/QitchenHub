import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root
    property string title: ""
    property string album: ""
    property string artist: ""
    property string picSource: ""
    Image {
        id: image
        anchors.fill: parent
        source: root.picSource
    }
    DropShadow {
        id: shadow
        anchors.fill: image
        horizontalOffset: 7
        verticalOffset: 7
        radius: 12
        samples: 24
        color: "#77000000"
        source: image
    }
}
