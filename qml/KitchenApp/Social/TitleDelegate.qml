import QtQuick 2.0

Item
{
    id: myDelegate
    width: delegate.ListView.view.width; height: delegate.ListView.view.height*.08
    Rectangle{
        id: myDelegateItem
        width: parent.width; height: ; border.color: "#8b988b"; radius: delegate.width*.03
        anchors.bottom: delegate.bottom
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            text: settingName
            color: "#c1c3c8"
            font.bold: true
            font.pixelSize: 14
        }
    }
    MouseArea{
        anchors.fill:  parent
    }
}
