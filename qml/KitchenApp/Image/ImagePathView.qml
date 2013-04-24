import QtQuick 2.0

Item{
    id: root
    width: parent.width
    height: parent.height
    Image{
        id: backArrow
        anchors.right: view.left
        source: "qrc:/images/rssBackArrow.png"
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width*.1
        height: parent.width*.1
        MouseArea{
            anchors.fill: parent
            onClicked: {
                view.decrementCurrentIndex();
            }
        }
    }
    PathView{
        id: view
        anchors.centerIn: parent
        height: parent.height*.5
        width: parent.width*.5
        model: LocalModel{}
        delegate: PathViewDelegate{}
        focus: true
    }
    Image{
        id: forwardArrow
        source: "qrc:/images/rssForwardArrow.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: view.right
        width: parent.width*.1
        height: parent.width*.1
        MouseArea{
            anchors.fill: parent
            onClicked: {
                view.incrementCurrentIndex()
            }
        }
    }
}
