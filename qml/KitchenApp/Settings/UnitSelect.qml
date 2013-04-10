import QtQuick 2.0

Rectangle {
    id: base
    property int headingSize: 16
    property string selectColor: "#55DDDDDD"

    Text {
        id: heading
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        font.family: fontFamily
        font.pixelSize: headingSize
        font.bold: true
        color: "#36C60F"
        text: qsTr("Units") + tr.emptyString
    }
    Rectangle {
        anchors.top: heading.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height - heading.height - heading.anchors.topMargin
        color: "transparent"
        Column {
            anchors.topMargin: 25
            anchors.fill: parent
            spacing: 25
            Rectangle {
                id: metricRect
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * .75; height: parent.width * .55
                radius: 20
                color: "transparent"
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pixelSize: headingSize
                    font.bold: true
                    color: "#36C60F"
                    text: qsTr("Metric") + tr.emptyString
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:  {
                        deselectMenu()
                        parent.color = selectColor
                        theMainApplication.setUnits("eu")
                    }
                }
            }
            Rectangle {
                id: imperialRect
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * .75; height: parent.width * .55
                radius: 20
                color: selectColor
                Text {
                    anchors.centerIn: parent
                    font.family: fontFamily
                    font.pixelSize: headingSize
                    font.bold: true
                    color: "#36C60F"
                    text: qsTr("Standard") + tr.emptyString
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:  {
                        deselectMenu()
                        parent.color = selectColor
                        theMainApplication.setUnits("us")
                    }
                }
            }
        }
    }

    // Function defintions ----------------------------------------------------

    function deselectMenu() {
        metricRect.color = imperialRect.color = "transparent"
    }
}
