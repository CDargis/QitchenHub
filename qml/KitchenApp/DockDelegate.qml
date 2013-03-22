import QtQuick 2.0

Loader {
    id: widgetLoader
    sourceComponent: loadWidget(widget)

    property int index
    property string widget

    function loadWidget(source) {
        var widgetComponent;
        //var widget;

        widgetComponent= Qt.createComponent(source);
        //widget= widgetComponent.createObject(root);
        return widgetComponent;
    }

    Connections{
        target: widgetLoader
    }
}


