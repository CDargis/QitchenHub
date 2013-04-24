import QtQuick 2.0

Rectangle{
    id: twitter
    Rectangle{
        id: twTitle
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height*.095
        width: parent.width
        color: "#8b988b"
        border.color: "black"
        Rectangle{
            id: twTitleItems
            anchors.centerIn: parent
            width: parent.width*0.98
            height: parent.height*0.90
            color: "black"
            Image{
                id: twitterImage
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.005
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width*.20
                height: parent.width*.20
                smooth: true
                source: "qrc:/images/twitter.png"
            }
            Text{
                id:twText
                anchors.left: twitterImage.right
                anchors.leftMargin: parent.width*.05
                anchors.bottom: twitterImage.bottom
                font.bold: true
                font.family: "DejaVu Serif"
                font.pointSize: 25;
                text: qsTr("Twitter") + tr.emptyString
                color: "#36C60F"
            }
        }
    }
    Flipable {
        id: twMain
        property var story;
        anchors.left: parent.left
        anchors.top: twTitle.bottom
        height: parent.height*0.9
        width: parent.width
        visible: true
        property bool flipped: false
        front:TwitterContent{
            id: twContent
            height: parent.height
            width: parent.width
            border.color: "#8b988b"
            color: "white"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#7C7C85" }
                GradientStop { position: 1.0; color: "#25242A" }
            }
        }
        back: TwitterSettings{
            id: twitterSettings
            height: parent.height
            width: parent.width
        }
        transform: Rotation {
            id: rotation
            origin.x: twMain.width/2
            origin.y: twMain.height/2
            axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: 0    // the default angle
        }

        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: twMain.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 300}
        }
    }

    Rectangle{
        id:twBottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height*.05
        color: "black"
        border.color: "#8b988b"
        Image {
            id: twBackArrow
            source: "qrc:/images/rssBackArrow.png"
            smooth: true
            signal clicked
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.01
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height*0.8
            height: parent.height*0.8
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    twContent.setActive(true)
                    twMain.flipped = false
                    twSettings.visible = true
                    twBackArrow.visible = false
                }

            }
        }
        Image {
            id: twSettings
            source: "qrc:/images/rssSettings.png"
            smooth: true
            signal clicked
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.01
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height*0.8
            height: parent.height*0.8
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    twContent.setActive(false);
                    twMain.flipped = true
                    twSettings.visible = false
                    twBackArrow.visible = true
                }
            }
        }
    }
}
