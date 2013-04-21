import QtQuick 2.0

Item {
    anchors.fill: parent

    function setUsersArtists(artists) {
        for(var a in artists)
            console.log(artists[a])
    }
}
