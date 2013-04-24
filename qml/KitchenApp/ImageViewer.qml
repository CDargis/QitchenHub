import QtQuick 2.0
import "Image"

AppInterface{
    id: root
    //widgetSrc: "Social/SocialWidget.qml"
    anchors.fill: parent
    Rectangle{
        id: iContainer
        height: parent.height*.1
        width: parent.width*.5
        border.color: "#36C60F"
        Text{
            id: imageGallery
            anchors.centerIn: parent
            color: "#36C60F"
            font.pixelSize: parent.height*.5
            text: qsTr("Gallery") + tr.emptyString
        }
    }
    Rectangle{
        id: gContainer
        anchors.left: iContainer.right
        height: parent.height*.1
        width: parent.width*.5
        border.color: "#36C60F"
        Text{
            id: googleSearch
            anchors.centerIn: parent
            color: "#36C60F"
            font.pixelSize: parent.height*.5
            text: qsTr("Google Search") + tr.emptyString
        }
    }
    Flipable{
        id: imageView
        anchors.top: gContainer.bottom
        height: parent.height*0.95
        width: parent.width
        visible: true
        property bool flipped: false
        front: GridView{
            id: grid
            clip: true
            height: parent.height*.95
            width: parent.width*.95
            anchors.centerIn: parent
            model: LocalModel{}
            delegate: PathViewDelegate{}
            cellWidth: parent.width*.5;
            cellHeight: parent.height*.5;
            verticalLayoutDirection: GridView.TopToBottom
            flow : GridView.TopToBottom
        }
        back: Rectangle{id: hi;}
    }
    function viewImage(source) {
        var component = Qt.createComponent("Image/ImageView.qml");
        imageView = component.createObject(root, {"source1": source});
    }
    function dec(){
        if(grid.currentIndex > 0){
            var idx = grid.currentIndex;
            grid.currentIndex = idx-1;
            return grid.model.get(grid.currentIndex).icon;
        }
        else{
            return grid.model.get(grid.currentIndex).icon;
        }
    }
    function inc(){
        if(grid.currentIndex < grid.count-1){
            var idx = grid.currentIndex;
            grid.currentIndex = idx+1;
            return grid.model.get(grid.currentIndex).icon;
        }
        else{
            return grid.model.get(grid.currentIndex).icon;
        }
    }
}
