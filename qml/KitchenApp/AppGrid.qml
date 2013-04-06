import QtQuick 2.0


Grid {
    id: root
    anchors.centerIn: parent
    //width: parent.width
    //anchors.verticalCenter: parent.verticalCenter
    //border.color: "#000000"
    columns: 4
    rowSpacing: 20
    columnSpacing: 20
    z: 0

    property int itemCount: root.children.length
    property int childWidth: 125

    Component.onCompleted: {
        /*console.debug("width: " + root.width);
        console.debug("nnnnnnnnnnn");

        itemCount = root.children.length;
        childWidth = root.children[0].width
        root.columns = (parent.width - columnSpacing) / childWidth;
        console.debug("width: " + parent.width);
        console.debug("colSpacing: " + columnSpacing);
        console.debug("children count: " + root.children.length);
        console.debug("child width: " + childWidth);
        console.debug("column count: " + root.columns);*/
    }
}
