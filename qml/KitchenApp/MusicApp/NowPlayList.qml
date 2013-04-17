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

    function addSong(song) {
        var component = Qt.createComponent("PlayItem.qml")
        component.createObject(theRow, { "height": 300, "width": 300, "picSource": song.picSource,
                                   "title": song.title, "album": song.album, "artist": song.artist} )
        theMusic.source = song.streamSource
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: "black"
        border.width: 1
    }
}
