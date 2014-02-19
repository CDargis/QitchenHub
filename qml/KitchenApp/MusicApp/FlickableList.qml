import QtQuick 2.0

Flickable {
    id: flick
    anchors.fill: parent
    flickableDirection: Flickable.VerticalFlick
    clip: true
    contentHeight: theColumn.height
    signal destroyingItem(var item)
    signal inputAddingItem(var item)
    Column {
        id: theColumn
        width: parent.width
        spacing: 2
    }

    onInputAddingItem: {
        addItem(item)
    }

    function clearItems() {
        for(var i = theColumn.children.length; i > 0; i--) {
            destroyingItem(theColumn.children[i - 1])
            theColumn.children[i - 1].destroy()
        }
    }

    function addItem(item) {
        var component = Qt.createComponent("ListItem.qml")
        var obj = component.createObject(theColumn, {"name": item, "height": 35, "width": parent.width})
    }

    function addSpecialItem() {
        var component = Qt.createComponent("AddListItem.qml")
        var obj = component.createObject(theColumn, {"height": 35, "width": parent.width})
    }

    // Delete the children first
    function addItems(items, special) {
        clearItems()
        if(special)
            addSpecialItem()
        for(var a in items) {
            var component = Qt.createComponent("ListItem.qml")
            var obj = component.createObject(theColumn, {"name": items[a], "height": 35,
                                           "width": parent.width} )
        }
    }
}
