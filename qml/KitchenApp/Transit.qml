import QtQuick 2.0
import QtWebKit 3.0

AppInterface {

    property var googleMaps
    property var map

    property string apiKey: "AIzaSyArvuWNnwVISUzZBG62o33Se2J2NBbQEYs"


    property string htmlStr: "<!DOCTYPE html>"
    +"<html>"
    +"<head>"
    +"<meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\" />"
    +"<style type=\"text/css\">"
    +"html { height: 100% }"
    +"body { height: 100%; margin: 0; padding: 0 }"
    +"#map_canvas { height: 100% }"
    +"</style>"
    +"<script type=\"text/javascript\""
    +"src=\"http://maps.googleapis.com/maps/api/js?key=" + apiKey + "&sensor=false\">"
    +"</script>"
    +"<script type=\"text/javascript\">"
    +"var map; "
    +"var marker; "
    +"function initialize() {"
    +"var myOptions = {"
    +"center: new google.maps.LatLng(" + 55.75 + ", " + 37.6166667 + "),"
    +"zoom: " + 15 + ","
    +"mapTypeId: google.maps.MapTypeId.ROADMAP,"
    +"panControl: true,"
    +"zoomControl: false,"
    +"mapTypeControl: false,"
    +"mapTypeControlOptions: {"
    +"position: google.maps.ControlPosition.RIGHT_CENTER"
    +"}"
    +"};"
    +"map = new google.maps.Map(document.getElementById(\"map_canvas\"), myOptions);"
    +"}"
    +"</script>"
    +"</head>"
    +"<body onload=\"initialize()\">"
    +"<div id=\"map_canvas\" style=\"width:100%; height:100%\"></div>"
    +"</body>"
    +"</html>"

    WebView {
        id: webView
        y: parent.height * 0.1
        height: parent.height * 0.9
        width: parent.width

        //width: 500
        //height: 600
        //url: "Transit/main.html"
        url: "http://maps.google.com"



        /*javaScriptWindowObjects:
            QtObject {
            id: windowObject
            WebView.windowObjectName: "qml"
            property int zoom: 15;
            property string mapTypeId: "google.maps.MapTypeId.ROADMAP";
            property double lat: 0.0
            property double lng: 0.0
        }*/

    }

    Component.onCompleted: {

        /*var client = new XMLHttpRequest();

        client.onreadystatechange = function() {

            if (client.readyState == XMLHttpRequest.DONE) {

                console.log(client.responseText);

                var result = eval('(' + client.responseText + ')');

                googleMaps = eval('(' + client.responseText + ')');

                initialize();
            }
        }

        client.open("GET", "https://maps.googleapis.com/maps/api/js?" +
                    "key=AIzaSyArvuWNnwVISUzZBG62o33Se2J2NBbQEYs" +
                    "&sensor=false" +
                    "&output=json");

        client.send();*/

        //console.log(htmlStr);

       // webView.loadHtml(htmlStr, "", "http://www.google.com");

        /*webView.evaluateJavaScript("window.qml.zoom=map.zoom;" +
                                   "window.qml.lat=map.center.lat(); window.qml.lng=map.center.lng();"
                                   );
        */
    }


    function initialize() {
      var mapOptions = {
        zoom: 8,
        center: new googleMaps.google.maps.LatLng(-34.397, 150.644),
        mapTypeId: googleMaps.google.maps.MapTypeId.ROADMAP
      }
      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

        console.log("zoom: " + map.getZoom());
    }





}
