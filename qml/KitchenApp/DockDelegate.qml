import QtQuick 2.0

Loader {
    id: widgetLoader
    sourceComponent: loadWidget(widget)
    width: parent.width * 0.9
    height: item.height
    anchors.horizontalCenter: parent.horizontalCenter

    property int index
    property string widget
    property Item app

    function loadWidget(source) {
        var widgetComponent;
        //var widget;

        widgetComponent= Qt.createComponent(source);
        //widget= widgetComponent.createObject(root);
        return widgetComponent;
    }

    Connections{
        target: widgetLoader.item
    }
}


