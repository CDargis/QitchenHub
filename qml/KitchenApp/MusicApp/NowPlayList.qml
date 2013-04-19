import QtQuick 2.0

Flickable {
    id: flick
    flickableDirection: Flickable.HorizontalFlick
    contentWidth: theRow.width + (250 / 2); contentHeight: theRow.height
    clip: true
    Row {
        id: theRow
        spacing: 40
    }
    onContentWidthChanged: {
        ensureVisible(theRow.children[theRow.children.length - 1])
    }

    // Function Definitions ----------------------------------------------------

    function ensureVisible(obj) {
        if(obj === undefined)
            return
        if(obj.x > contentX)
            contentX = contentWidth - obj.x
    }

    function addSong(song) {
        var component = Qt.createComponent("PlayItem.qml")
        var obj = component.createObject(theRow, { "height": 250, "width": 250, "picSource": song.picSource,
                                   "title": song.title, "album": song.album, "artist": song.artist} )
        theMusic.source = song.streamSource
    }
}
