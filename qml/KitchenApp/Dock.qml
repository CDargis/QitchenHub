import QtQuick 2.0
/*Rectangle{
    id: container
    color: "gold"*/


    Flickable {
        //anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick

        clip: true
        contentHeight: column.height


        Column {
            id: column
            width: parent.width
            height: childrenRect.height
            spacing: 5

        }

        /*MouseArea {
            id: passer
            anchors.fill: parent
            onPressed: {
                console.debug("pressed on flickable");
            }
        }*/

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



//}


