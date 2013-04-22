import QtQuick 2.0

Item {
    id: root;
    width: root.ListView.view.width;
    height: if(tweet.height > twContent.height*.1){tweet.height+tweet.height*.10}else{twContent.height*.1}
    Rectangle {
        id: background
        color: "black";
        opacity: 0.3;
        height: root.height*.98;
        width: root.width;
    }
    Image {
        id: icon;
        source: userImage;
        anchors.left: background.left
        anchors.verticalCenter: parent.verticalCenter
        width:parent.width*.18;
        height:parent.width*.18;
        opacity:0 ;
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
        id:tweet;
        text: '<html><style type="text/css">a:link {color:"#36C60F"; text-decoration:none}</style>'
              +getTime(timestamp) + "<br /><b>"
              + '<a href="app://@"><b>'+userName(name) + "</b></a>:"
              + "<br /><b>" + statusText + "</b></html>";
        textFormat: Qt.RichText
        color: "white";
        wrapMode: Text.WordWrap
        anchors.left: icon.right
        anchors.right: background.right
        anchors.leftMargin: parent.width*.02;
        anchors.rightMargin: parent.width*.02;
    }
    function userName(str) {
        var atSign = "@"
        var user = atSign.concat(str)
        user = user.replace(/\([\S|\s]*\)/gi, "");
        return user.trim();
    }
    function getTime(str) {
        var time = str.replace("Z", " ");
        time = time.replace("T", " | ");
        return time.trim();
    }
}

