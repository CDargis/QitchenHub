import QtQuick 2.0

Flickable {
    id: gpContent
    flickableDirection: Flickable.VerticalFlick
    interactive: true
    clip: true
    contentHeight: column.height
    Column{
        id: column
        //height: childrenRect.height
        width: parent.width
        Rectangle{
            id: item1
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + parent.width*.02
            Image{
                id: icon1
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi1.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name1
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon1.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "David"
            }
            Text{
                id: time
                anchors.right: text1.right
                anchors.bottom: name1.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "5:30 PM"
            }
            Text{
                id: text1
                anchors.top: name1.bottom
                anchors.left: icon1.right
                anchors.right: arrow1.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "A bunch of random text, a bunch of reaaaaaaaaally loooooooooong test. Trying to get length"
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow1
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
        //2nd post
        Rectangle{
            id: item2
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + parent.width*.02
            Image{
                id: icon2
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi2.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name2
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon2.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "William D."
            }
            Text{
                id: time2
                anchors.right: text2.right
                anchors.bottom: name2.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "7:20 PM"
            }
            Text{
                id: text2
                anchors.top: name2.bottom
                anchors.left: icon2.right
                anchors.right: arrow2.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "Just ate at the new restaurant on Taylor. Who wants to go next week with me?"
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow2
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
        //3rd
        Rectangle{
            id: item3
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + parent.width*.02
            Image{
                id: icon3
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi3.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name3
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon3.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "Kenny"
            }
            Text{
                id: time3
                anchors.right: text3.right
                anchors.bottom: name3.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "5:35 PM"
            }
            Text{
                id: text3
                anchors.top: name3.bottom
                anchors.left: icon3.right
                anchors.right: arrow3.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "I'm down with Will! Who else wants to come to the new restaurant? The more the merrier! #GroupOuting"
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow3
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
        //4th post
        Rectangle{
            id: item4
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + parent.width*.02
            Image{
                id: icon4
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi4.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name4
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon4.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "Kim"
            }
            Text{
                id: time4
                anchors.right: text4.right
                anchors.bottom: name4.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "5:55 PM"
            }
            Text{
                id: text4
                anchors.top: name4.bottom
                anchors.left: icon4.right
                anchors.right: arrow4.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "I would go! However I have two exams and a project due soon. Sorry! Raincheck? "
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow4
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }

        //5th post
        Rectangle{
            id: item5
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + parent.width*.02
            Image{
                id: icon5
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi5.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name5
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon5.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "Jay Moore"
            }
            Text{
                id: time5
                anchors.right: text5.right
                anchors.bottom: name5.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "6:30 PM"
            }
            Text{
                id: text5
                anchors.top: name5.bottom
                anchors.left: icon5.right
                anchors.right: arrow5.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "Peter! We should tag along? I'll only go if you go. Should be fun. Blah Blah Blah"
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow5
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
        //6th post

        Rectangle{
            id: item6
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + parent.width*.02
            Image{
                id: icon6
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi6.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name6
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon6.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "Bridget"
            }
            Text{
                id: time6
                anchors.right: text6.right
                anchors.bottom: name6.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "7:30 PM"
            }
            Text{
                id: text6
                anchors.top: name6.bottom
                anchors.left: icon6.right
                anchors.right: arrow6.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "I would go but I don't want to be seen with you losers in public ;)"
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow6
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
        Rectangle{
            id: item7
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + parent.width*.02
            Image{
                id: icon7
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi7.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name7
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon7.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "Vin"
            }
            Text{
                id: time7
                anchors.right: text7.right
                anchors.bottom: name7.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "5:30 PM"
            }
            Text{
                id: text7
                anchors.top: name7.bottom
                anchors.left: icon7.right
                anchors.right: arrow7.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "^ That's not nice Bridget. With that aside we all know the true reason is lack of funds."
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow7
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
        Rectangle{
            id: item8
            color: "white"
            border.color: "#8b988b"
            width: parent.width
            height: childrenRect.height + width*.02
            Image{
                id: icon8
                anchors.left: parent.left
                anchors.leftMargin: parent.width*.01
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                source: "qrc:/images/avi8.jpg"
                width: parent.width*.15
                height: width
                smooth: true
            }
            Text{
                id: name8
                anchors.top: parent.top
                anchors.topMargin: parent.width*.02
                anchors.left: icon8.right
                anchors.leftMargin: parent.width*.01
                font.family: "Sans"
                font.bold: true
                font.pixelSize: parent.width*.06
                text: "Me:"
            }
            Text{
                id: time8
                anchors.right: text8.right
                anchors.bottom: name8.bottom
                font.family: "Sans"
                font.pixelSize: parent.width*.045
                color: "gray"
                text: "9:30 PM"
            }
            Text{
                id: text8
                anchors.top: name8.bottom
                anchors.left: icon8.right
                anchors.right: arrow8.left
                font.family: "Sans"
                font.pixelSize: parent.width*.05
                text: "I'm in! See you at 10!"
                wrapMode: Text.WordWrap
            }
            Image{
                id: arrow8
                anchors.right: parent.right
                anchors.rightMargin: parent.width*.01
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/forward.png"
                width: parent.width*.068
                height: width
                smooth: true
            }
        }
    }

    states: [
        State {
            name: "collasped"
            PropertyChanges {
                target: fbCol
                height: 0
            }
            when: labelArea.expand
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { target: fbCol; property: "height"; duration: 400 }
        }
    ]
}
