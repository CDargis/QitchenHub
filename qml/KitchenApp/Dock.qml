import QtQuick 2.0
Flickable {
    id: root
    flickableDirection: Flickable.VerticalFlick
    clip: true
    contentHeight: column.height

    Column {
        id: column
        width: parent.width
        height: childrenRect.height
        spacing: 5

        Clock {
        }
    }


    function createWidget(source, app) {
        var component;
        var widgetNum;
        component = Qt.createComponent("DockDelegate.qml");
        widgetNum = component.createObject(column,{"widget": source, "app": app});

        console.debug(column.children.length);

        if (widgetNum == null) {
            // Error Handling
            console.log("Error creating object");
        }
    }
}

