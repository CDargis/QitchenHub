var rootURL = "https://ws.audioscrobbler.com/2.0/"
var apiKey = "fd04949ecca5f5d53a875f057fce53e6"
var secret = "7c3fbe145db18c2974e75e3aff2e5daa"
var user =  "chrisdargis"
var pass = "qitchenhub"

var session_key = "2f9748d20f64463e10821f88ffe0d2e0"
var playList = []

// Objects -----------------------------------------

function Song(title, album, artist, streamSource, picSource) {
    this.title = title
    this.album = album
    this.artist = artist
    this.streamSource = streamSource
    this.picSource = picSource
}

// Function definions ----------------------------------------------------------

function radioSearch() {
    var request = rootURL + "?method=radio.search" + "&name=ozzy%20osbourne" + "&api_key="
            + apiKey + "&format=json" + "&api_sig="
            + getSignature("api_key", apiKey, "method", "radio.search", "name", "ozzy osbourne")
    makeRequest("POST", request, function(json) { printJSON(json) })
}


function getPlaylist() {
    var request = rootURL + "?method=radio.getPlaylist" + "&api_key=" + apiKey
            + "&sk=" + session_key + "&format=json" + "&api_sig=" +
            getSignature("api_key", apiKey, "method", "radio.getPlaylist", "sk", session_key)
    makeRequest("POST", request, function(json) {
        /**
        nowPlaying.currentArtist = json.playlist.trackList.track[0].creator
        nowPlaying.currentTitle = json.playlist.trackList.track[0].title
        nowPlaying.currentAlbum = json.playlist.trackList.track[0].album
        nowPlaying.currentPicSource = json.playlist.trackList.track[0].image
        */
        var song = new Song(json.playlist.trackList.track[0].title,
                            json.playlist.trackList.track[0].album,
                            json.playlist.trackList.track[0].creator,
                            json.playlist.trackList.track[0].location,
                            json.playlist.trackList.track[0].image)
        nowPlaying.addItem(song)
        theMusic.source = json.playlist.trackList.track[0].location
        theMusic.play()
    });
}


function tune(type, resource, subtype) {
    var station = "lastfm://" + type + "/" + resource + "/" + subtype
    var request = rootURL + "?method=radio.tune" + "&station=" + station + "&api_key=" + apiKey
            + "&sk=" + session_key + "&format=json" + "&api_sig=" +
            getSignature("api_key", apiKey, "method", "radio.tune", "sk", session_key,
                         "station", station)
    makeRequest("POST", request)
}

function authenticate() {
    var str = "auth.getMobileSession&username=" + user + "&password=" + pass
               + "&api_key=" + apiKey + "&format=json"
    var request = rootURL + "?method=" + str + "&api_sig=" + getSignature("api_key",
                     apiKey, "method", "auth.getMobileSession", "password", pass, "username", user)
    makeRequest("POST", request, function(json) { session_key = json.session.key })
}

// Send params in alphabetical order
function getSignature() {
    var encode = ""
    for(var i = 0; i < arguments.length; i++) {
        encode += arguments[i]
    }
    encode += secret
    return Qt.md5(encode)
}

function makeRequest(method, request, callback) {
    var doc = new XMLHttpRequest()
    doc.onreadystatechange = function() {
        if(doc.readyState === XMLHttpRequest.DONE) {
            try {
                var json = JSON.parse(doc.responseText)
                if(json.message !== undefined)      // Print out errors
                    console.log("ERROR " + json.error + ":" + json.message)
                else
                    if(callback)
                        callback(json)
            }
            catch(e) {
                console.log(e)
            }
        }
    }
    doc.open(method, request)
    doc.setRequestHeader("encoding", "UTF-8")
    doc.send()
}

function printJSON(json) {
    var asString = JSON.stringify(json)
    console.log(asString)
}

function addSpaceEncoding(str) {
    return str.replace(/ /g, "%20")
}

function removeSpaceEncoding(str) {
    return str.replace(/%20/g, ' ')
}
