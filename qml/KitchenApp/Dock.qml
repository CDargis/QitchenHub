import QtQuick 2.0
Rectangle{
    id: container
    color: "gold"

    //create widget vars

    Flickable{
        anchors.horizontalCenter: parent.horizontalCenter
        flickableDirection: Flickable.VerticalFlick
        height: container.height
        width: container.width
        clip: true
        contentWidth: column.width
        contentHeight: column.height

        Column {
            id: column
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

        if (widgetNum == null) {
            // Error Handling
            console.log("Error creating object");
        }
    }
}
