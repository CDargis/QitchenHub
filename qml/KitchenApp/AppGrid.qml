<<<<<<< HEAD
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
    property var activeList: [0, 0, 0, 0, 0, 0, 0, 0]

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

    function terminateIndex(index){
        activeList[index] = 0;
    }
}
=======
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

    property int maxZ: 1
    property var activeList: [0, 0, 0, 0, 0, 0, 0, 0]

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

    function terminateIndex(index){
        activeList[index] = 0;
    }

    function getMaxZ() {
        return maxZ;
    }

    function incrementMaxZ() {
        maxZ++;
    }
}
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
