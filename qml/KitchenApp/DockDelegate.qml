import QtQuick 2.0

Loader {
    id: widgetLoader
    sourceComponent: loadWidget(widget)
    width: parent.width * 0.9
    height: item.height
    anchors.horizontalCenter: parent.horizontalCenter

    // defined here but accessible in widget components
    property int index
    property string widget
    property Item app

    function loadWidget(source) {
        var widgetComponent;

        widgetComponent= Qt.createComponent(source);
        return widgetComponent;
    }

    Connections{
        target: widgetLoader.item
    }
}


