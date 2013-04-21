var rootURL = "https://ws.audioscrobbler.com/2.0/"
var apiKey = "fd04949ecca5f5d53a875f057fce53e6"
var secret = "7c3fbe145db18c2974e75e3aff2e5daa"
var user =  "chrisdargis"
var pass = "qitchenhub"

var session_key = "2f9748d20f64463e10821f88ffe0d2e0"
var playlist = []

// Objects -----------------------------------------

var Song = function(title, album, artist, streamSource, picSource, duration, loved) {
    this.title = title
    this.album = album
    this.artist = artist
    this.streamSource = streamSource
    this.picSource = picSource
    this.duration = duration
    this.loved = loved

    Song.prototype.toString = function() {
        return this.artist + ": " + this.title
    }
}

// Function definions ----------------------------------------------------------

function loveTrack(track, artist) {
    var request = rootURL + "?method=track.love" + "&track=" + track
            + "&artist=" + artist + "&api_key=" + apiKey + "&sk=" + session_key
            + "&format=json" + "&api_sig=" + getSignature("api_key", apiKey, "artist", artist,
                                                          "method", "track.love", "sk", session_key,
                                                          "track", track)
    makeRequest("POST", request, function(json) {
        console.debug(json.status)
    });
}

function banTrack(track, artist) {
    var request = rootURL + "?method=track.ban" + "&track=" + track
            + "&artist=" + artist + "&api_key=" + apiKey + "&sk=" + session_key
            + "&format=json" + "&api_sig=" + getSignature("api_key", apiKey, "artist", artist,
                                                          "method", "track.ban", "sk", session_key,
                                                          "track", track)
    makeRequest("POST", request, function(json) {
        console.debug(json.status)
    });
}

function nextTrack() {
    var callback = function() { nowPlaying.addSong(playlist.shift()); theMusic.play() }
    // Refresh the playlist if needed
    if(playlist.length === 0)
        getPlaylist(callback)
    else callback()
}

function getPlaylist(callBack) {
    var request = rootURL + "?method=radio.getPlaylist" + "&api_key=" + apiKey
            + "&sk=" + session_key + "&format=json" + "&api_sig=" +
            getSignature("api_key", apiKey, "method", "radio.getPlaylist", "sk", session_key)
    makeRequest("POST", request, function(json) {
        for(var track in json.playlist.trackList.track) {
            var song = new Song(json.playlist.trackList.track[track].title,
                                json.playlist.trackList.track[track].album,
                                json.playlist.trackList.track[track].creator,
                                json.playlist.trackList.track[track].location,
                                json.playlist.trackList.track[track].image,
                                json.playlist.trackList.track[track].duration,
                                json.playlist.trackList.track[track].extension.loved === "1" ? true : false)
            playlist.push(song)
        }
        if(callBack && (callBack !== undefined))
            callBack()
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

// For debug
function printPlaylist() {
    for(var song in playlist)
        console.log(playlist[song].toString())
}

// Currently not useful!
/**
function radioSearch() {
    var request = rootURL + "?method=radio.search" + "&name=ozzy%20osbourne" + "&api_key="
            + apiKey + "&format=json" + "&api_sig="
            + getSignature("api_key", apiKey, "method", "radio.search", "name", "ozzy osbourne")
    makeRequest("POST", request, function(json) { printJSON(json) })
}
*/
