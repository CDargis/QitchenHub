import QtQuick 2.0

Flickable {
    id: flick
    flickableDirection: Flickable.HorizontalFlick
    contentWidth: theRow.width + (250 / 2); contentHeight: theRow.height
    clip: true
    property int albumCenterX: 0
    onAlbumCenterXChanged: {
        flick.state = "newSong"
        stateChangeTimer.start()
    }

    Timer {
        id: stateChangeTimer
        running: false
        interval: 1002
        repeat: false
        onTriggered: flick.state = "noSong"
    }

    Row {
        id: theRow
        spacing: 40
    }
    onContentWidthChanged: {
        // Song is being added!
        dimAlbumArt(theRow.children[theRow.children.length - 2])
        ensureVisible(theRow.children[theRow.children.length - 1])
    }

    states: [
        State {
            id: newSong
            name: "newSong"
            PropertyChanges {
                target: flick; contentX: albumCenterX
            }
        },
        State {
            id: nostate
            name: "noSong"
            PropertyChanges {
                target: flick; contentX: albumCenterX
            }
        }
    ]

    transitions: Transition {
        reversible: false
        PropertyAnimation {
            property: "contentX";
            easing.type: Easing.InOutQuart;
            duration: 1000
        }
    }

    // Function Definitions ----------------------------------------------------

    function dimAlbumArt(obj) {
        if(obj === undefined)
            return
        obj.opacity = .3
    }

    function ensureVisible(obj) {
        if(obj === undefined)
            return
        if(obj.x > contentX) {
           // albumCenterX = obj.x
        }
    }

    function addSong(song) {
        var component = Qt.createComponent("PlayItem.qml")
        var obj = component.createObject(theRow, { "height": 250, "width": 250, "picSource": song.picSource,
                                   "title": song.title, "album": song.album, "artist": song.artist} )
        theMusic.source = song.streamSource
    }
}
