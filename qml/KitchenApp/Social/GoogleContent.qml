import QtQuick 2.0

Flickable {
    id: gpContent
    flickableDirection: Flickable.VerticalFlick
    interactive: true
    clip: true
    contentHeight: column.height
    property real pHeight: parent.height
    Column{
        id: column
        height: childrenRect.height
        width: parent.width
        Rectangle{
            id: item1
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: pHeight*.2
            Text{
                id: name1
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.height*.12
                text: "Dan Smith"
            }
            Text{
                id: date1
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: name1.right
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                color: "gray"
                text: "Yesterday 12:39 PM"
            }
            Text{
                id: post1
                anchors.top: date1.bottom
                anchors.topMargin: parent.height*.05
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                text: "Hey Dan! Just checking in. Send me a SMS or call me later when you can"
                width: parent.width - parent.width*.03
                wrapMode: Text.WordWrap
            }
        }
        Rectangle{
            id: addShareBox
            width: parent.width
            anchors.left: parent.left
            height: pHeight*.06
            //border.color: "#8b988b"
            color: "white"
            Image{
                id: share1
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                height: parent.height*.84
                width: height*3.2
                source: "qrc:/images/google1Arrow.png"
            }
            Rectangle{
                id: count
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                height: parent.height*.66
                width: height*1.43
                anchors.rightMargin: width*1.7
                Text{
                    id: countplus
                    text: "+23"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    anchors.left: parent.left
                    font.family: "Sans"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Image{
                    id: share11
                    anchors.left: countplus.right
                    anchors.leftMargin: parent.width*.15
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height*.70
                    width: parent.width*.70
                    source: "qrc:/images/googleshare.png"
                    smooth: true
                }
                Text{
                    id: countshare
                    text: "10"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    font.family: "Sans"
                    anchors.left: share11.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
        Image{
            id: comment1
            anchors.left: parent.left
            width: parent.width
            height: width*.13
            source: "qrc:/images/comment.png"
            smooth: true
        }



        //post 2
        Rectangle{
            id: item2
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: pHeight*.2
            Text{
                id: name2
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.height*.12
                text: "Kate Reed"
            }
            Text{
                id: date2
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: name2.right
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                color: "gray"
                text: "Yesterday 08:20 AM"
            }
            Text{
                id: post2
                anchors.top: date2.bottom
                anchors.topMargin: parent.height*.05
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                text: "Google Drive is pretty good! Very useful and a must have for any student."
                width: parent.width - parent.width*.03
                wrapMode: Text.WordWrap
            }
        }
        Rectangle{
            id: addShareBox2
            width: parent.width
            anchors.left: parent.left
            height: pHeight*.06
            //border.color: "#8b988b"
            color: "white"
            Image{
                id: share2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                height: parent.height*.84
                width: height*3.2
                source: "qrc:/images/google1Arrow.png"
            }
            Rectangle{
                id: count2
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                height: parent.height*.66
                width: height*1.43
                anchors.rightMargin: width*1.7
                Text{
                    id: countplus2
                    text: "+78"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    anchors.left: parent.left
                    font.family: "Sans"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Image{
                    id: share22
                    anchors.left: countplus2.right
                    anchors.leftMargin: parent.width*.15
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height*.70
                    width: parent.width*.70
                    source: "qrc:/images/googleshare.png"
                    smooth: true
                }
                Text{
                    id: countshare2
                    text: "44"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    font.family: "Sans"
                    anchors.left: share22.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
        Image{
            id: comment2
            anchors.left: parent.left
            width: parent.width
            height: width*.13
            source: "qrc:/images/comment.png"
            smooth: true
        }



        //post3
        Rectangle{
            id: item3
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: pHeight*.2
            Text{
                id: name3
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.height*.12
                text: "Steven Nichols"
            }
            Text{
                id: date3
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: name3.right
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                color: "gray"
                text: "April 15th, 2013"
            }
            Text{
                id: post3
                anchors.top: date3.bottom
                anchors.topMargin: parent.height*.05
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                text: "Looking ahead, I see bad, bad things ahead not just for Windows 8.x but for Windows period."
                width: parent.width - parent.width*.03
                wrapMode: Text.WordWrap
            }
        }
        Rectangle{
            id: addShareBox3
            width: parent.width
            anchors.left: parent.left
            height: pHeight*.06
            //border.color: "#8b988b"
            color: "white"
            Image{
                id: share3
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                height: parent.height*.84
                width: height*3.2
                source: "qrc:/images/google1Arrow.png"
            }
            Rectangle{
                id: count3
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                height: parent.height*.66
                width: height*1.43
                anchors.rightMargin: width*2.4
                Text{
                    id: countplus3
                    text: "+999"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    anchors.left: parent.left
                    font.family: "Sans"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Image{
                    id: share33
                    anchors.left: countplus3.right
                    anchors.leftMargin: parent.width*.15
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height*.70
                    width: parent.width*.70
                    source: "qrc:/images/googleshare.png"
                    smooth: true
                }
                Text{
                    id: countshare3
                    text: "999"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    font.family: "Sans"
                    anchors.left: share33.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
        Image{
            id: comment3
            anchors.left: parent.left
            width: parent.width
            height: width*.13
            source: "qrc:/images/comment.png"
            smooth: true
        }

        //post 4
        Rectangle{
            id: item4
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: pHeight*.2
            Text{
                id: name4
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.height*.12
                text: "Steven Nichols"
            }
            Text{
                id: date4
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: name4.right
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                color: "gray"
                text: "April 15th, 2013"
            }
            Text{
                id: post4
                anchors.top: date4.bottom
                anchors.topMargin: parent.height*.05
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                text: "I know a lot of you may think I hate Windows, however I just don't like fact that they break easily and need to be cleaned every week."
                width: parent.width - parent.width*.03
                wrapMode: Text.WordWrap
            }
        }
        Rectangle{
            id: addShareBox4
            width: parent.width
            anchors.left: parent.left
            height: pHeight*.06
            //border.color: "#8b988b"
            color: "white"
            Image{
                id: share4
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                height: parent.height*.84
                width: height*3.2
                source: "qrc:/images/google1Arrow.png"
            }
            Rectangle{
                id: count4
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                height: parent.height*.66
                width: height*1.43
                anchors.rightMargin: width*2.4
                Text{
                    id: countplus4
                    text: "+999"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    anchors.left: parent.left
                    font.family: "Sans"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Image{
                    id: share44
                    anchors.left: countplus4.right
                    anchors.leftMargin: parent.width*.15
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height*.70
                    width: parent.width*.70
                    source: "qrc:/images/googleshare.png"
                    smooth: true
                }
                Text{
                    id: countshare4
                    text: "999"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    font.family: "Sans"
                    anchors.left: share44.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
        Image{
            id: comment4
            anchors.left: parent.left
            width: parent.width
            height: width*.13
            source: "qrc:/images/comment.png"
            smooth: true
        }
        Rectangle{
            id: item5
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: pHeight*.2
            Text{
                id: name5
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.height*.12
                text: "Dan Peters"
            }
            Text{
                id: date5
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                anchors.left: name5.right
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                color: "gray"
                text: "April 14th, 2013"
            }
            Text{
                id: post5
                anchors.top: date5.bottom
                anchors.topMargin: parent.height*.05
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.height*.12
                text: "You hung out"
                width: parent.width - parent.width*.03
                wrapMode: Text.WordWrap
            }
            Text{
                id: post55
                anchors.top: post5.bottom
                anchors.topMargin: parent.height*.05
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: parent.height*.12
                text: "1 person hung out with you"
                width: parent.width - parent.width*.03
                wrapMode: Text.WordWrap
            }
        }
        Rectangle{
            id: addShareBox5
            width: parent.width
            anchors.left: parent.left
            height: pHeight*.06
            //border.color: "#8b988b"
            color: "white"
            Image{
                id: share5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                height: parent.height*.84
                width: height*3.2
                source: "qrc:/images/google1Arrow.png"
            }
            Rectangle{
                id: count5
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                height: parent.height*.66
                width: height*1.43
                anchors.rightMargin: width*2.4
            }
        }

        //post 6
        Rectangle{
            id: item6
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height
            Text{
                id: name6
                anchors.top: parent.top
                anchors.topMargin: pHeight*.2*.2
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.bold: true
                font.pixelSize: pHeight*.2*.12
                text: "ESPN"
            }
            Text{
                id: date6
                anchors.top: parent.top
                anchors.topMargin: pHeight*.2*.2
                anchors.left: name6.right
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: pHeight*.2*.12
                color: "gray"
                text: "April 13th, 2013"
            }
            Text{
                id: post6
                anchors.top: date6.bottom
                anchors.topMargin: pHeight*.2*.05
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.03
                font.family: "Sans"
                font.pixelSize: pHeight*.2*.12
                text: "One of these days, +LeBron James is gonna break the rim. "
                width: parent.width - parent.width*.03
                wrapMode: Text.WordWrap
            }
            Image{
                source: "qrc:/images/miami.png"
                anchors.top: post6.bottom
                width: parent.width
                height: width*.56
                smooth: true
            }
        }
        Rectangle{
            id: addShareBox6
            width: parent.width
            anchors.left: parent.left
            height: pHeight*.06
            //border.color: "#8b988b"
            color: "white"
            Image{
                id: share6
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.02
                height: parent.height*.84
                width: height*3.2
                source: "qrc:/images/google1Arrow.png"
            }
            Rectangle{
                id: count6
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                height: parent.height*.66
                width: height*1.43
                anchors.rightMargin: width*2.4
                Text{
                    id: countplus6
                    text: "+26"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    anchors.left: parent.left
                    font.family: "Sans"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Image{
                    id: share66
                    anchors.left: countplus6.right
                    anchors.leftMargin: parent.width*.15
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height*.70
                    width: parent.width*.70
                    source: "qrc:/images/googleshare.png"
                    smooth: true
                }
                Text{
                    id: countshare6
                    text: "45"
                    color: "gray"
                    font.pixelSize: parent.height*.7
                    font.family: "Sans"
                    anchors.left: share66.right
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
        Image{
            id: comment6
            anchors.left: parent.left
            width: parent.width
            height: width*.13
            source: "qrc:/images/comment.png"
            smooth: true
        }
    }
}
