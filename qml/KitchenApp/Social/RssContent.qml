import QtQuick 2.0

Rectangle{
    id: rssContent
    property var story;
    anchors.fill: parent
    border.color: "#8b988b"
    clip: true
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#7C7C85" }
        GradientStop { position: 1.0; color: "#25242A" }
    }
    ListView {
        id: feeds
        anchors.fill: parent
        model: rssFeeds
        delegate: SourceDelegate{}
        clip: true
        interactive: false
        MouseArea{
            propagateComposedEvents: true
            onClicked:{
                mouse.accepted = false
            }
        }
    }
    function viewStory(){
        rssMain.visible = false;
        rssBackArrow.visible = true
        page.state = "read";
    }
}
