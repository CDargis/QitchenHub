import QtQuick 2.0

Loader {
    id: widgetLoader
    sourceComponent: loadWidget(widget)

    property int index
    property string widget

    width: .06*1920
    height: .10*1080

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
