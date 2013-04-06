import QtQuick 2.0

Grid {
    id: root
    width: parent.width * 0.85
    height: parent.height - root.y;
    //border.color: "#000000"
    columns: 3
    rowSpacing: 20
    columnSpacing: 20
    z: 0

    property int itemCount: root.children.length
    property int childWidth: 125

    onChildrenChanged: {
        itemCount = root.children.length;
        root.columns = (width - columnSpacing) / childWidth;
        console.debug("width: " + width);
        console.debug("colSpacing: " + columnSpacing);
        console.debug("children count: " + root.children.length);
        console.debug("column count: " + root.columns);
    }
}
