import QtQuick 2.0

Flickable {
    id: flick
    anchors.fill: parent
    flickableDirection: Flickable.HorizontalAndVerticalFlick
    clip: true
    contentHeight: theColumn.height
    signal destroyingItem(var item)
    Column {
        id: theColumn
        width: parent.width
        spacing: 2
    }

    function clearItems() {
        for(var i = theColumn.children.length; i > 0; i--) {
            destroyingItem(theColumn.children[i - 1])
            theColumn.children[i - 1].destroy()
        }
    }

    // Delete the children first
    function addItems(items) {
        clearItems()
        for(var a in items) {
            var component = Qt.createComponent("ListItem.qml")
            var obj = component.createObject(theColumn, {"name": items[a], "height": 35,
                                           "width": parent.width} )
        }
    }
}
