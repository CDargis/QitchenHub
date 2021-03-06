<<<<<<< HEAD
import QtQuick 2.0
import "testVal.js" as Script1




AppInterface
{
    property Item wall;
    property string widText;
    widgetSrc : "kitchenWidget.qml"
    function flickWall() {
        var component2 = Qt.createComponent("Loading.qml");

        component2.createObject(wall);
        var component4 = Qt.createComponent("BaseWall.qml");

        wall = component4.createObject(cat1);
        var component = Qt.createComponent("FlickWall.qml");

        wall = component.createObject(cat1);/*,"count":);*/

        }

    function createSpriteObjects(xPos,yPos,cnt,imgsrc,jsonObject,jsonObject2,url,calories,ingredients,time,rating) {

        var xframe;
        if(xPos > (1088))
        {xframe = 1088 - (xPos - 1088)}
        else
        {
            xframe = 0
        }
        var title = jsonObject.matches[cnt].recipeName;

console.log(url)
        title = title.toString();
        console.log(title)
        var component = Qt.createComponent("FlickItem.qml");
        component.createObject(wall.contentItem, {"color":"white",
                                   "x":xPos,"y":yPos,"src":imgsrc,"opacity":1,"title":title,"xpos":xPos,"ypos":y,"xframe":xframe,"url":url,"calories":calories,"ingredients":ingredients,"time":time,"rating":rating});


    }




    property variant recipeid;
    id:appFull


    Rectangle {
    anchors.fill: parent
    gradient: Gradient {
        GradientStop {
            position: 0.0; color: "#7c7c85" }

        GradientStop {
            position: 1.0; color: "#25242a" }}
        //opacity:0
    }



function loaded(jsonObject)
{


    var sources = [];
    var url = [];
    var calories = [];
    var ingredients = [];
    var time = [];
    var rating = [];

  flickWall();

var i;



    for(i = 0;i<35;i++)
    {

        var rid = jsonObject.matches[i].id;
        var rname = jsonObject.matches[i].recipeName;

 launch2(rid,i,sources,jsonObject,rname,url,calories,ingredients,time,rating);



    }







}

function loaded2(jsonObject2,i,sources,jsonObject,url,calories,ingredients,time,rating)
{var x;
    var a = 0;

    var count = 0;
   var x1 = 80;
    if(jsonObject2.nutritionEstimates[0] != undefined)

    var recipeid = jsonObject.matches[i].id
    url[i] = "http://www.yummly.com/recipe/external/"+recipeid+""
    sources[i] = jsonObject2.images[0].hostedLargeUrl;
    if(jsonObject2.nutritionEstimates[0] != undefined)

    {
        calories[i] = jsonObject2.nutritionEstimates[0].value;
    }
    else
    {calories[i] = 300}
    ingredients[i] = jsonObject2.ingredientLines[0] + "," + jsonObject2.ingredientLines[1] + "," + jsonObject2.ingredientLines[2] + ","+ jsonObject2.ingredientLines[3] + ","+ jsonObject2.ingredientLines[4] + ","+ jsonObject2.ingredientLines[5] + ","+ jsonObject2.ingredientLines[6] + ","+ jsonObject2.ingredientLines[7]
    time[i] = (jsonObject.matches[i].totalTimeInSeconds)/60;
    rating[i] = Math.floor((Math.random()*5)+1);
    console.log("ca")
    console.log(calories[i]);

    if (jsonObject2.nutritionEstimates == [])
    {calories[i] = 300;}
    if(time[i] == 0)
    {time[i] = Math.floor((Math.random()*199)+55);}
    //title();
    if(i == 34)
    {
        for(var l = 0;l<35/*jsonObject.totalMatchCount*/;l++)
        {
            var imgsrc = sources[l];
            if(imgsrc != undefined)
            if(count == 3)
                {count = 0;
                x1 = x1 + 290;
                a = 0;}
            createSpriteObjects(x1,95 + a,l,imgsrc,jsonObject,jsonObject2,url[l],calories[l],ingredients[l],time[l],rating[l]);
                a = a + 180;
            count++;
         }
    }
}
Image
{
    anchors.bottom:parent.bottom
    anchors.right: parent.right
    anchors.bottomMargin: 20
    anchors.rightMargin: 180
    source:"images/searchWhite.png"
    height: 30
    width:30
}
Rectangle
{
id:search
color: "#ffffff"
width:150
height:30
radius:4
anchors.bottom: parent.bottom
anchors.right: parent.right
anchors.bottomMargin: 20
anchors.rightMargin: 20
TextInput
{
    anchors.fill: search
text:"Search here.."
opacity:0.7
font.pixelSize: 20

    font.italic: true
    id:searchText
   focus:true
    Keys.onReturnPressed:
    {console.log(searchText.text)
        launch(searchText.text);
        if(appFull.state == "")
                                        {appFull.state = "load";
                                          }
    }
}
}
Flickable {
    id:recipeHome
opacity:1

anchors.top: parent.top
anchors.topMargin: parent.height*0.1
   // Component.onCompleted: {opacity:1}
    width: parent.width ; height: parent.height*0.9
    contentWidth: 1350; contentHeight: r1.height
    flickableDirection: Flickable.HorizontalFlick
    clip: true


Rectangle{
    Rectangle{id: r1
              x:143
              y:180
            width:170
            height:370
            color:"black"
            Image {
                anchors.fill: parent
                source: "images/Beef.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: 36
                font.family: "Helvetica"
                font.bold: true
                text:"Beef"
anchors.bottom: parent.bottom
width:170
horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("beef");

            }
            }



    }

    Rectangle{id: r2
              x:343
              y:180
              width:170
              height:370
            color:"black"

            Image {
                anchors.fill: parent
                source: "images/Steak.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: 36
                font.family: "Helvetica"
                font.bold: true
                text:"Steak"
anchors.bottom: parent.bottom
width:170
horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("steak");
            }
            }

    }
    Rectangle{id: r3
              x:543
              y:180
              width:170
              height:370
            color:"black"

            MouseArea{
            anchors.fill: parent
            Image {
                anchors.fill: parent
                source: "images/Chicken.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: 36
                font.family: "Helvetica"
                font.bold: true
                text:"Chicken"
anchors.bottom: parent.bottom
width:170
horizontalAlignment: Text.AlignHCenter
}
            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("chicken");
            }
            }

    }
    Rectangle{id: r4
              x:743
              y:180
              width:170
              height:370
            color:"black"
            Image {
                anchors.fill: parent
                source: "images/Vegetarian.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: 36
                font.family: "Helvetica"
                font.bold: true
                text:"Vegan"
anchors.bottom: parent.bottom
width:170
horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("vegan");
            }
            }
    }
    Rectangle{id: r5
              x:943
              y:180
              width:170
              height:370
            color:"black"
            Image {
                anchors.fill: parent
                source: "images/Healthy.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: 36
                font.family: "Helvetica"
                font.bold: true
                text:"Healthy"
anchors.bottom: parent.bottom
width:170
horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("healthy");
            }
            }
    }
    Rectangle{id: r6
              x:1143
              y:180
              width:170
              height:370
            color:"black"

            Image {
                anchors.fill: parent
                source: "images/Drinks.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: 36
                font.family: "Helvetica"
                font.bold: true
                text:"Drinks"
anchors.bottom: parent.bottom
width:170
horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("drinks");
            }
            }
    }


}
}



function launch(cat)
{
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {

                var jsonObject = eval('(' + doc.responseText + ')');
            loaded(jsonObject);


        }
    }

    doc.open("GET", "http://api.yummly.com/v1/api/recipes?_app_id=04b4ce46&_app_key=ffc9e76df577de742ccf1583911a0a67&q=" + cat  +"&requirePictures=true");

    //doc.open("GET", "http://api.yummly.com/v1/api/recipe/recipe-id")
    doc.send();


}

function launch2(rid,i,sources,jsonObject,rname,url,calories,ingredients,time,rating)
{

    var doc2 = new XMLHttpRequest();

    doc2.open("GET", "http://api.yummly.com/v1/api/recipe/"+rid+"?_app_id=04b4ce46&_app_key=ffc9e76df577de742ccf1583911a0a67");
    doc2.send();
    doc2.onreadystatechange = function() {
        if (doc2.readyState == XMLHttpRequest.DONE) {


            var jsonObject2 = eval('(' + doc2.responseText + ')');


            loaded2(jsonObject2,i,sources,jsonObject,url,calories,ingredients,time,rating);


            //console.log(test);
//}

        }
    }



}

Rectangle {
    id:cat1
    opacity: 0
    x:-1280


   // anchors.centerIn: parent
width:parent.width
height:parent.height
gradient: Gradient {
    GradientStop {id:g1
        position: 0.0; color: "#7c7c85" }

    GradientStop { id:g2
        position: 1.0; color: "#25242a" }}







}
Image{
    id:goback
    source:"images/Back.png"
    anchors.bottom:parent.bottom
    anchors.left: parent.left
    width:480/3
    height:320/3
opacity: 0
    anchors.leftMargin: 20

}
MouseArea{
anchors.fill: goback
onClicked: {wall.destroy();
    if(appFull.state == "load")
                                    {appFull.state = "";
                                      }}
}

Text{id:recipeid}
states: [
    State {
        name: "load"
        PropertyChanges {
            target: cat1
            opacity:1
            x:0
        }
        PropertyChanges {
            target: goback
            opacity:1
        }

    }

]
transitions: [
    Transition {

        from: ""
        to: "load"
        NumberAnimation{properties: "opacity,x"
            duration: 500

    }},
    Transition{
        from: "load"
        to:""
        NumberAnimation{properties: "opacity,x"
            duration: 500

    }

    }
]


}


=======

import QtQuick 2.0
//import "testVal.js" as Script1



AppInterface
{
    property Item wall;

    property string widText;
    widgetSrc : "kitchenWidget.qml"
    function flickWall() {
        var component2 = Qt.createComponent("Loading.qml");

        component2.createObject(wall);
        var component4 = Qt.createComponent("BaseWall.qml");

        wall = component4.createObject(cat1);
        var component = Qt.createComponent("FlickWall.qml");

        wall = component.createObject(cat1);/*,"count":);*/

        }

    function createSpriteObjects(xPos,yPos,cnt,imgsrc,jsonObject,jsonObject2,url,calories,ingredients,time,rating) {

        var xframe;
        if(xPos > (1088))
        {xframe = 1088 - (xPos - 1088)}
        else
        {
            xframe = 0
        }
        var title = jsonObject.matches[cnt].recipeName;


        title = title.toString();

        console.log(appFull.width)
        console.log(appFull.height)
        var component = Qt.createComponent("FlickItem.qml");
        component.createObject(wall.contentItem, {"color":"white","mainW":appFull.width,"mainH":appFull.height,
                                   "x":xPos,"y":yPos,"src":imgsrc,"opacity":1,"title":title,"xpos":xPos,"ypos":y,"xframe":xframe,"url":url,"calories":calories,"ingredients":ingredients,"time":time,"rating":rating});


    }




    property variant recipeid;
    id:appFull


    Rectangle {
    anchors.fill: parent
    gradient: Gradient {
        GradientStop {
            position: 0.0; color: "#7c7c85" }

        GradientStop {
            position: 1.0; color: "#25242a" }}
        //opacity:0
    }



function loaded(jsonObject)
{


    var sources = [];
    var url = [];
    var calories = [];
    var ingredients = [];
    var time = [];
    var rating = [];

  flickWall();

var i;



    for(i = 0;i<35;i++)
    {

        var rid = jsonObject.matches[i].id;
        var rname = jsonObject.matches[i].recipeName;

 launch2(rid,i,sources,jsonObject,rname,url,calories,ingredients,time,rating);



    }







}

function loaded2(jsonObject2,i,sources,jsonObject,url,calories,ingredients,time,rating)
{var x;
    var a = 0;

    var count = 0;
   var x1 = ((80)/(1224))*parent.width;
    if(jsonObject2.nutritionEstimates[0] != undefined)

    var recipeid = jsonObject.matches[i].id
    url[i] = "http://www.yummly.com/recipe/external/"+recipeid+""
    sources[i] = jsonObject2.images[0].hostedLargeUrl;
    if(jsonObject2.nutritionEstimates[0] != undefined)

    {
        calories[i] = jsonObject2.nutritionEstimates[0].value;
    }
    else
    {calories[i] = 300}
    ingredients[i] = jsonObject2.ingredientLines[0] + "," + jsonObject2.ingredientLines[1] + "," + jsonObject2.ingredientLines[2] + ","+ jsonObject2.ingredientLines[3] + ","+ jsonObject2.ingredientLines[4] + ","+ jsonObject2.ingredientLines[5] + ","+ jsonObject2.ingredientLines[6] + ","+ jsonObject2.ingredientLines[7]
    time[i] = (jsonObject.matches[i].totalTimeInSeconds)/60;
    rating[i] = Math.floor((Math.random()*5)+1);

    if (jsonObject2.nutritionEstimates == [])
    {calories[i] = 300;}
    if(time[i] == 0)
    {time[i] = Math.floor((Math.random()*199)+55);}
    //title();
    if(i == 34)
    {
        for(var l = 0;l<35/*jsonObject.totalMatchCount*/;l++)
        {
            var imgsrc = sources[l];
            if(imgsrc != undefined)
            if(count == 3)
                {count = 0;
                x1 = x1 + ((290)/(1224))*parent.width;;
                a = 0;}
            createSpriteObjects(x1,((95)/(1224))*parent.width + a,l,imgsrc,jsonObject,jsonObject2,url[l],calories[l],ingredients[l],time[l],rating[l]);
                a = a + ((180)/(1224))*parent.width;;
            count++;
         }
    }
}
Image
{
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.topMargin: parent.height/10
    anchors.rightMargin: parent.width/5.7
    source:"images/searchWhite.png"


    height: parent.height/28.05
    width:parent.width/40.8
}
Rectangle
{
id:search
color: "#ffffff"
width:parent.width/8.16
height:parent.height/28.05
radius:4
anchors.top: parent.top
anchors.right: parent.right
anchors.topMargin: parent.height/10
anchors.rightMargin: parent.width/20
VirtualInput
{
    anchors.fill: search
    currentText: qsTr("Search here..") + tr.emptyString





    id:searchText
  // focus:true
    Keys.onReturnPressed:
    {console.log(searchText.text)
        launch(searchText.currentText);
        if(appFull.state == "")
                                        {appFull.state = "load";
                                          }
    }
}
}
Flickable {
    id:recipeHome
opacity:1

anchors.top: parent.top
anchors.topMargin: parent.height*0.15
   // Component.onCompleted: {opacity:1}
    width: parent.width ; height: parent.height*0.85
    contentWidth: appFull.width*1.4

    flickableDirection: Flickable.HorizontalFlick
    clip: true


    Rectangle{id: r1
           anchors.top: parent.top
           anchors.left: parent.left
           anchors.topMargin: parent.height/5
           anchors.leftMargin: parent.width/8
           width:recipeHome.width/6
           height:recipeHome.height/1.7



            color:"black"
            Image {
                anchors.fill: parent
                source: "images/Beef.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: recipeHome.width/34
                font.family: "Helvetica"
                font.bold: true
                text:qsTr("Beef") + tr.emptyString

anchors.bottom: parent.bottom
width:r1.width
horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("beef");

            }
            }



    }

    Rectangle{id: r2
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height/5
        anchors.leftMargin: parent.width/3.4
        width:recipeHome.width/6
        height:recipeHome.height/1.7
            color:"black"

            Image {
                anchors.fill: parent
                source: "images/Steak.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
               font.pixelSize: recipeHome.width/34
               width:r2.width
                font.family: "Helvetica"
                font.bold: true
                text:qsTr("Steak") + tr.emptyString
anchors.bottom: parent.bottom

horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("steak");
            }
            }

    }
    Rectangle{id: r3
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height/5
        anchors.leftMargin: parent.width/2.16
        width:recipeHome.width/6
        height:recipeHome.height/1.7

            color:"black"

            MouseArea{
            anchors.fill: parent
            Image {
                anchors.fill: parent
                source: "images/Chicken.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: recipeHome.width/34
                width:r2.width
                font.family: "Helvetica"
                font.bold: true
                text:qsTr("Chicken") + tr.emptyString
anchors.bottom: parent.bottom
horizontalAlignment: Text.AlignHCenter
}
            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("chicken");
            }
            }

    }
    Rectangle{id: r4
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height/5
        anchors.leftMargin: parent.width/1.59
        width:recipeHome.width/6
        height:recipeHome.height/1.7
            color:"black"
            Image {
                anchors.fill: parent
                source: "images/Vegetarian.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: recipeHome.width/34
                width:r2.width
                font.family: "Helvetica"
                font.bold: true
                text:qsTr("Vegan") + tr.emptyString
anchors.bottom: parent.bottom

horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("vegan");
            }
            }
    }
    Rectangle{id: r5
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height/5
        anchors.leftMargin: parent.width/1.25
        width:recipeHome.width/6
        height:recipeHome.height/1.7
            color:"black"
            Image {
                anchors.fill: parent
                source: "images/Healthy.png"
            }
            Image {
                anchors.fill: parent
                source: "images/BlackGradient.png"
            }
            Text{
                color: "#ffffff"
                font.pixelSize: recipeHome.width/34
                width:r2.width
                font.family: "Helvetica"
                font.bold: true
                text:qsTr("Healthy") + tr.emptyString
anchors.bottom: parent.bottom

horizontalAlignment: Text.AlignHCenter
}
            MouseArea{
            anchors.fill: parent

            onClicked: {
                {if(appFull.state == "")
                                {appFull.state = "load";
                                  }}
             launch("healthy");
            }
            }
    }


}


function launch(cat)
{
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {

                var jsonObject = eval('(' + doc.responseText + ')');
            loaded(jsonObject);


        }
    }


    doc.open("GET", "http://api.yummly.com/v1/api/recipes?_app_id=22759353&_app_key=94454e4573986179b5bc43c1313c1b4f&q=" + cat  +"&requirePictures=true");

    doc.send();


}

function launch2(rid,i,sources,jsonObject,rname,url,calories,ingredients,time,rating)
{

    var doc2 = new XMLHttpRequest();

    doc2.open("GET", "http://api.yummly.com/v1/api/recipe/"+rid+"?_app_id=22759353&_app_key=94454e4573986179b5bc43c1313c1b4f");
    doc2.send();
    doc2.onreadystatechange = function() {
        if (doc2.readyState == XMLHttpRequest.DONE) {


            var jsonObject2 = eval('(' + doc2.responseText + ')');


            loaded2(jsonObject2,i,sources,jsonObject,url,calories,ingredients,time,rating);
            //console.log(test);
//}

        }
    }



}

Rectangle
{
    id:cat1
    opacity: 0
    x:-parent.width


width:parent.width
height:parent.height
gradient: Gradient {
    GradientStop {id:g1
        position: 0.0; color: "#7c7c85" }

    GradientStop { id:g2
        position: 1.0; color: "#25242a" }}





}
Image
{id:toolButton
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.topMargin: 0.65*parent.height/20
    anchors.rightMargin: 1.1*parent.width/5.7
    source:"images/plainButton.png"


    height: 4.4*parent.height/24
    width:6*parent.width/40
    Text {
        anchors.centerIn: parent
font.pixelSize: 0.9*parent.height/4
font.bold: true
        text:qsTr("Tools") + tr.emptyString
        color:"#19BA19"
    }
    MouseArea{
    anchors.fill: parent

    onClicked: {
        {if(appFull.state == "")
                        {appFull.state = "loadTools";
                          }}


    }
    }
}

Rectangle {
    id:tools
    opacity: 0

y:-parent.height

   // anchors.centerIn: parent
width:parent.width
height:parent.height
//gradient: Gradient {
//    GradientStop {id:g1
//        position: 0.0; color: "#7c7c85" }

//    GradientStop { id:g2
//        position: 1.0; color: "#25242a" }}

Tools{
    gradient: Gradient {
        GradientStop {
            position: 0.0; color: "#7c7c85" }

        GradientStop {
            position: 1.0; color: "#25242a" }
        }
}



}

Image{
    id:goback
    source:"images/plainButton.png"
    anchors.bottom:parent.bottom
    anchors.left: parent.left
    height: 4.4*parent.height/24
    width:6*parent.width/40
opacity: 0
    anchors.leftMargin: 20
    Text {
        font.pixelSize: 0.9*
                        parent.height/4
        font.bold: true
anchors.centerIn: parent
        text: qsTr("Back") + tr.emptyString
        color:"#19BA19"
    }

}
MouseArea{
anchors.fill: goback
onClicked: {
    if(appFull.state == "load")
   { wall.destroy();}
    if(appFull.state == "load"||appFull.state == "loadTools")
                                    {appFull.state = "";

                                      }}
}

Text{id:recipeid}
states: [
    State {
        name: "load"
        PropertyChanges {
            target: cat1
            opacity:1
            x:0
        }
        PropertyChanges {
            target: goback
            opacity:1
        }
        PropertyChanges {
            target: toolButton
            opacity:0
        }

    },
    State {
        name: "loadTools"
        PropertyChanges {
            target: tools
            opacity:1
            y:0
        }
        PropertyChanges {
            target: goback
            opacity:1
        }

    }

]
transitions: [
    Transition {

        from: ""
        to: "load"
        NumberAnimation{properties: "opacity,x"
            duration: 500

    }},
    Transition{
        from: "load"
        to:""
        NumberAnimation{properties: "opacity,x"
            duration: 500

    }

    },
    Transition {

        from: ""
        to: "loadTools"
        NumberAnimation{properties: "opacity,y"
            duration: 500

    }},
    Transition{
        from: "loadTools"
        to:""
        NumberAnimation{properties: "opacity,y"
            duration: 500

    }

    }
]


}
>>>>>>> cbb4f5b92a5ed8ae0df3627c98d1387d7cafd1aa
