import QtQuick 2.0

Item {
    id: root;
    width: parent.width
    height: if(tweet.paintedHeight < icon.height){icon.height + name1.height}else{tweet.paintedHeight+name1.paintedHeight}
    Rectangle {
        id: background
        color: "white";
        opacity: 0.35;
        border.color: "#8b988b"
        anchors.fill: parent
    }
    Image {
        id: icon;
        source: userImage;
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width:parent.width*.18;
        height:parent.width*.18;
        opacity: 0;
        smooth: true
        onStatusChanged: {
            if(status==Image.Ready)
                icon.state="loaded"
        }
        states: State {
            name: "loaded";
            PropertyChanges { target: icon ; opacity:1 }
        }
        transitions: Transition { NumberAnimation { target: icon; property: "opacity"; duration: 200 } }

    }
    Text {
        id:name1;
        text: userName(name)
        font.family: "Sans"
        color: "black"
        font.bold: true
        font.pixelSize: parent.width*.05
        anchors.left: icon.right
        anchors.leftMargin: parent.width*.02;
    }
    Text {
        id:time;
        text: getTime(timestamp)
        font.family: "Sans"
        color: "white"
        font.pixelSize: parent.width*.04
        anchors.right: parent.right
        //anchors.rightMargin: time.paintedWidth;
        anchors.verticalCenter: name1.verticalCenter
    }
    Text {
        id:tweet;
        text: statusText
        font.family: "Sans"
        color: "black"
        width: parent.width - icon.width - parent.width*.02
        font.pixelSize: parent.width*.045
        anchors.left: icon.right
        anchors.top: name1.bottom
        wrapMode: Text.WordWrap
        anchors.leftMargin: parent.width*.02;
    }
    function userName(str) {
        var atSign = "@"
        var user = atSign.concat(str)
        user = user.replace(/\([\S|\s]*\)/gi, "");
        return user.trim();
    }
    function getTime(str) {
        var time = str.replace("Z", " ");
        time = time.replace("T", " @");
        time = time.substring(5);
        return time.trim();
    }
}

