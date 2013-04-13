import QtQuick 2.0
import "Social"

AppInterface{
    Rectangle{
        id:main
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        Rectangle{
            id: facebook
            anchors.left: parent.left
            width: parent.width*0.25
            height: parent.height
            Rectangle{
                id: fbTitle
                anchors.top: parent.top
                anchors.left: parent.left
                height: parent.height*.095
                width: parent.width
                color: "#8b988b"
                border.color: "black"
                Rectangle{
                    id: fbTitleItems
                    anchors.centerIn: parent
                    width: parent.width*0.98
                    height: parent.height*0.90
                    color: "black"
                    Image{
                        id: facebookImage
                        anchors.left: parent.left
                        anchors.leftMargin: parent.width*.005
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width*.20
                        height: parent.width*.20
                        smooth: true
                        source: "qrc:/images/facebook.png"
                    }
                    Text{
                        id:fbText
                        anchors.left: facebookImage.right
                        anchors.leftMargin: parent.width*.05
                        anchors.bottom: facebookImage.bottom
                        font.bold: true
                        font.family: "Sans"
                        font.pointSize: 25;
                        text: qsTr("Facebook") + tr.emptyString
                        color: "#36C60F"
                    }
                }
            }
            Rectangle{
                id: fbContent
                anchors.left: parent.left
                anchors.top: fbTitle.bottom
                height: parent.height*0.9
                width: parent.width
                border.color: "#8b988b"
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#7C7C85" }
                    GradientStop { position: 1.0; color: "#25242A" }
                }
            }
            Rectangle{
                id:fbBottom
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height*.05
                color: "black"
                border.color: "#8b988b"
                Image {
                    id: fbBackArrow
                    source: "qrc:/images/rssBackArrow.png"
                    smooth: true
                    signal clicked
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.01
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height*0.8
                    height: parent.height*0.8
                    MouseArea {
                        anchors.fill: parent
                        onClicked: hide()
                    }
                }
                Image {
                    id: fbSettings
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
                        onClicked: hide()
                    }
                }
            }
        }
        Rectangle{
            id: twitter
            anchors.left: facebook.right
            width: parent.width*0.25
            height: parent.height
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
                        font.family: "Sans"
                        font.pointSize: 25;
                        text: qsTr("Twitter") + tr.emptyString
                        color: "#36C60F"
                    }
                }
            }
            Rectangle{
                id: twContent
                anchors.left: parent.left
                anchors.top: twTitle.bottom
                height: parent.height*0.9
                width: parent.width
                border.color: "#8b988b"
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#7C7C85" }
                    GradientStop { position: 1.0; color: "#25242A" }
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
                    MouseArea {
                        anchors.fill: parent
                        onClicked: hide()
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
                        onClicked: hide()
                    }
                }
            }
        }
        Rectangle{
            id: google
            anchors.left: twitter.right
            width: parent.width*0.25
            height: parent.height
            Rectangle{
                id: gpTitle
                anchors.top: parent.top
                anchors.left: parent.left
                height: parent.height*.095
                width: parent.width
                color: "#8b988b"
                border.color: "black"
                Rectangle{
                    id: gpTitleItems
                    anchors.centerIn: parent
                    width: parent.width*0.98
                    height: parent.height*0.90
                    color: "black"
                    Image{
                        id: googleImage
                        anchors.left: parent.left
                        anchors.leftMargin: parent.width*.005
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width*.20
                        height: parent.width*.20
                        smooth: true
                        source: "qrc:/images/googleplus.png"
                    }
                    Text{
                        id:gpText
                        anchors.left: googleImage.right
                        anchors.leftMargin: parent.width*.05
                        anchors.bottom: googleImage.bottom
                        font.bold: true
                        font.family: "Sans"
                        font.pointSize: 25;
                        text: qsTr("Google") + tr.emptyString
                        color: "#36C60F"
                    }
                }
            }
            Rectangle{
                id: gpContent
                anchors.left: parent.left
                anchors.top: gpTitle.bottom
                height: parent.height*0.9
                width: parent.width
                border.color: "#8b988b"
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#7C7C85" }
                    GradientStop { position: 1.0; color: "#25242A" }
                }
            }
            Rectangle{
                id:gpBottom
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height*.05
                color: "black"
                border.color: "#8b988b"
                Image {
                    id: gpBackArrow
                    source: "qrc:/images/rssBackArrow.png"
                    smooth: true
                    signal clicked
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.01
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height*0.8
                    height: parent.height*0.8
                    MouseArea {
                        anchors.fill: parent
                        onClicked: hide()
                    }
                }
                Image {
                    id: gpSettings
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
                        onClicked: hide()
                    }
                }
            }
        }
        Rectangle{
            id: rss
            anchors.left: google.right
            width: parent.width*0.25
            height: parent.height
            Rectangle{
                id: rssTitle
                anchors.top: parent.top
                anchors.left: parent.left
                height: parent.height*.095
                width: parent.width
                color: "#8b988b"
                border.color: "black"
                Rectangle{
                    id: rssTitleItems
                    anchors.centerIn: parent
                    width: parent.width*0.98
                    height: parent.height*0.90
                    color: "black"
                    Image{
                        id: rssImage
                        anchors.left: parent.left
                        anchors.leftMargin: parent.width*.005
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width*.20
                        height: parent.width*.20
                        smooth: true
                        source: "qrc:/images/rss.png"
                    }
                    Text{
                        id:rssText
                        anchors.left: rssImage.right
                        anchors.leftMargin: parent.width*.05
                        anchors.bottom: rssImage.bottom
                        font.bold: true
                        font.family: "Sans"
                        font.pointSize: 25;
                        text: qsTr("Rss") + tr.emptyString
                        color: "#36C60F"
                    }
                }
            }
            Rectangle{
                id: rssContent
                anchors.left: parent.left
                anchors.top: rssTitle.bottom
                height: parent.height*0.9
                width: parent.width
                visible: true
                border.color: "#8b988b"
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#7C7C85" }
                    GradientStop { position: 1.0; color: "#25242A" }
                }
            }
            Rectangle{
                id: rssSettings
                anchors.left: parent.left
                anchors.top: rssTitle.bottom
                height: parent.height*0.9
                width: parent.width
                visible: false
                border.color: "#36C60F"
                color: "black"
            }
            Rectangle{
                id:rssBottom
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height*.05
                color: "black"
                border.color: "#8b988b"
                Image {
                    id: rssBackArrow
                    source: "qrc:/images/rssBackArrow.png"
                    smooth: true
                    signal clicked
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.01
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height*0.8
                    height: parent.height*0.8
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rssSettings.visible = false
                            rssContent.visible = true
                        }
                    }
                }
                Image {
                    id: rssSettingsButton
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
                        onClicked: {
                            rssContent.visible = false
                            rssSettings.visible = true
                        }
                    }
                }
            }
        }
    }
}

