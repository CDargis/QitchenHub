import QtQuick 2.0

Rectangle {
    id: base
    property int iconSide: height * .12
    property int headingSize: 16
    property string selectColor: "#99DDDDDD"

    Text {
        id: langHeading
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        font.family: fontFamily
        font.pixelSize: headingSize
        font.bold: true
        color: "#36C60F"
        text: qsTr("Language") + tr.emptyString
    }

    // invisible divider
    Rectangle {
        id: div
        anchors.horizontalCenter: parent.horizontalCenter
        width: 1; height: parent.height
        color: "transparent"
    }

    Column {
        id: leftColumn
        anchors.top: langHeading.bottom
        anchors.topMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: div.left
        anchors.rightMargin: 15
        spacing: 15
        Rectangle {
            id: unitedStates
            color: selectColor
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/United States-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                    theMainApplication.language = "en"
                }
            }
        }
        Rectangle {
            id: lithuania
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Lithuania-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
        Rectangle {
            id: france
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/France-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
        Rectangle {
            id: germany
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Germany-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
        Rectangle {
            id: jamaica
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Jamaica-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
    }
    Column {
        id: rightColumn
        anchors.top: langHeading.bottom
        anchors.topMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: div.right
        anchors.leftMargin: 15
        spacing: 15
        Rectangle {
            id: poland
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Poland-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                    theMainApplication.language = "pl"
                }
            }
        }
        Rectangle {
            id: russia
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Russia-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
        Rectangle {
            id: mexico
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Mexico-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
        Rectangle {
            id: czech
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Czech Republic-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
        Rectangle {
            id: italy
            color: "transparent"
            radius: 20
            height: iconSide*1.2; width: iconSide*1.6
            Image {
                anchors.centerIn: parent
                height: iconSide; width: iconSide
                source: "qrc:/flags/languages/Italy-01.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deselectAll()
                    parent.color = selectColor
                }
            }
        }
    }

    // Function definitions ------------------------------------------------------------------

    function deselectAll() {
        unitedStates.color = lithuania.color = france.color = germany.color = jamaica.color =
                poland.color = russia.color = mexico.color = czech.color = italy.color = "transparent"
    }
}
