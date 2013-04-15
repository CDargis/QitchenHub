import QtQuick 2.0

Flickable {
    id: flick
    flickableDirection: Flickable.HorizontalFlick
    contentWidth: theRow.width; contentHeight: theRow.height
    clip: true
    Row {
        id: theRow
        spacing: 40
    }

    // Function Definitions ----------------------------------------------------

    function addItem(song) {
        var component = Qt.createComponent("PlayItem.qml")
        component.createObject(theRow, { "height": 200, "width": 200, "picSource": song.picSource} )
    }
}
