import QtQuick 2.0

Rectangle {
    id: base
    property int headingSize: 16

    Text {
        id: heading
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        font.family: fontFamily
        font.pixelSize: headingSize
        font.bold: true
        color: "#36C60F"
        text: qsTr("Picture") + tr.emptyString
    }
}
