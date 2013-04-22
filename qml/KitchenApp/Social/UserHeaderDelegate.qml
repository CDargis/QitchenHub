import QtQuick 2.0

Rectangle {
    id: root
    width: root.ListView.view.width; height: root.ListView.view.height
    Rectangle{
        id: userInfo
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.top: parent.top
        Image{
            id: background
            source: "qrc:/images/twUserHeader.png"
            smooth: true
            width: parent.width
            height: parent.height
        }
        Image{
            id: userIcon
            source: image
            anchors.top: parent.top
            anchors.topMargin: parent.width*.05
            smooth: true
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.21
            height: parent.width*0.21
        }
        Text{
            id: userFullName
            anchors.top: userIcon.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: name
            color: "white"
            font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.height*.11
        }
        Text{
            id: userName
            anchors.top: userFullName.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: "@" + screenName
            color: "white"
            //font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.height*.09
        }
        Text{
            id: userDescription
            anchors.top: userName.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*.98
            wrapMode: Text.Wrap
            text: description
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            font.family: "Sans"
            font.pixelSize: parent.height*.06
        }
        Text{
            id: userLocation
            anchors.top: userDescription.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: location
            color: "white"
            font.bold: true
            font.family: "Sans"
            font.pixelSize: parent.height*.06
        }
    }
    Rectangle{
        id: miscInfo
        color: "white"
        width: parent.width
        height: parent.height*.22
        anchors.top: userInfo.bottom
        Rectangle{
            id: tweetInfo
            width: parent.width*.3333
            height: parent.height
            anchors.left: parent.left
            border.color: "gray"
            Text{
                id: tweetsCount
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                text: tweets
                color: "black"
                font.bold: true
                font.family: "Sans"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text{
                id: tweetsLabel
                anchors.top: tweetsCount.bottom
                text: "TWEETS"
                color: "gray"
                font.family: "Sans"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle{
            id: followingInfo
            width: parent.width*.3333
            height: parent.height
            anchors.left: tweetInfo.right
            border.color: "gray"
            Text{
                id: followingCount
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                text: following
                color: "black"
                font.bold: true
                font.family: "Sans"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text{
                id: followingLabel
                anchors.top: followingCount.bottom
                text: "FOLLOWING"
                color: "gray"
                font.family: "Sans"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle{
            id: followerInfo
            width: parent.width*.3333
            height: parent.height
            anchors.left: followingInfo.right
            border.color: "gray"
            Text{
                id: followerCount
                anchors.top: parent.top
                anchors.topMargin: parent.height*.2
                text: followers
                color: "black"
                font.bold: true
                font.family: "Sans"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text{
                id: followerLabel
                anchors.top: followerCount.bottom
                text: "FOLLOWERS"
                color: "gray"
                font.family: "Sans"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
