import QtQuick 2.0
Rectangle{
    id: container
    color: "gold"


    Flickable {
        anchors.fill: container
        flickableDirection: Flickable.VerticalFlick

        clip: true
        contentWidth: column.width
        contentHeight: column.height


        Column {
            id: column
            anchors.fill: parent
            width: childrenRect.width
            height: childrenRect.height
            spacing: 5

        }
    }


    function createWidget(source) {
        var component;
        var widgetNum;
        component = Qt.createComponent("DockDelegate.qml");
        widgetNum = component.createObject(column,{"widget": source});

        console.debug(column.children.length);

        if (widgetNum == null) {
            // Error Handling
            console.log("Error creating object");
        }
    }
}


