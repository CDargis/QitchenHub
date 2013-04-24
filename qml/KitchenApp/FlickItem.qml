import QtQuick 2.0
import QtWebKit 3.0
//import QtGraphicalEffects 1.0

Rectangle {
   id: name
   signal send (string notice)
opacity: 0


function set(g)
{
    appFull.widText = g
}

property string title: ""
property string xpos: ""
property string ypos: ""
property string url: ""
property string xframe: ""
property string calories: ""
property string src: ""
property string ingredients: ""
property string time:""
property string rating:""

property string test: ""

Flipable {
    id: flipable
width:240
height:240
    property bool flipped: false

    front: Rectangle { id:frontRec
        width:240
        height:160
        Image{

            id:recipeimages
            anchors.fill: frontRec
            source: src

//     z:-1


        }

        Image{id:blackGradient
            anchors.fill: recipeimages
            source:"images/BlackGradient.png"


        }
//        Image {
//            id: image
//            anchors.fill: parent
//            source:
//        }
       /* DropShadow {
            id: shadow
            anchors.fill: recipeimages
            horizontalOffset: 7
            verticalOffset: 7
            radius: 12
            samples: 24
            color: "#77000000"
            //source: recipeimages
            opacity: 0.5
        }*/


        MouseArea{anchors.fill: recipeimages
     onClicked:{
         var a = 3;

         var component2 = Qt.createComponent("Loading.qml");
     var il=0;
         component2.createObject(wall);


         var component = Qt.createComponent("Webs.qml");

         component.createObject(wall,{"url":url});/*,"count":);*/
set(ingredients)



     }
        }
        Text {

            id: title1
            anchors.bottom: recipeimages.bottom
            anchors.left: recipeimages.left
            anchors.leftMargin: 5
            anchors.horizontalCenter: recipeimages.horizontalCenter
            anchors.bottomMargin: 5
            color: "white"
            font.pixelSize: 15
            width:240
            wrapMode: Text.Wrap
            maximumLineCount: 2
            font.bold: true
            font.family: "Helvetica[Neue]"
     text:title
              }

        Rectangle{
            id:infoButton
            parent:frontRec
            anchors.top : frontRec.top
            anchors.right: frontRec.right
            width:30
            height:15
            border.color: "white"
            opacity: 0.6
            radius:3
            anchors.rightMargin: 6
            anchors.topMargin: 6



        }
        MouseArea{
            anchors.fill: infoButton
             onClicked: flipable.flipped = !flipable.flipped
        }
        Text
        {
            anchors.centerIn: infoButton
            text:"info"
            font.letterSpacing: 1
            font.family: "Helvetica"
            font.pixelSize: 10
            color:"black"
            font.bold: true

        }
    }
    back: Rectangle {id:backRec
        width:240; height:160;
        gradient: Gradient {
            GradientStop {id:g1
                position: 0.0; color: "#7c7c85" }

            GradientStop { id:g2
                position: 1.0; color: "#7f7878" }
        }
        Rectangle{id:ing
            width:240
        height:110
       gradient: Gradient {
           GradientStop {
               position: 0.0; color: "#7c7c85" }

           GradientStop {
               position: 1.0; color: "#7f7878" }
       }

        Text {

            text: "Ingredients"
            anchors.top: parent.top
            anchors.topMargin: 5
            font.bold: true
            font.family: "Helvetica"
        horizontalAlignment: Text.AlignHCenter
            color:"white"
            x:80
        }


        Text {
        parent:ing
        anchors.top: parent.top
      anchors.topMargin: 24
        width:230
         font.pixelSize: 15
         font.family: "Helvetica"
         color:"white"
         wrapMode: Text.Wrap
maximumLineCount: 5
  horizontalAlignment: Text.AlignHCenter
  text:ingredients

        }
        Rectangle
        {
            anchors.left: parent.left
            width:240
            height:1
            y:109
        }
        }


        Rectangle{
            anchors.bottom: parent.bottom
            width:80
        height:50
       gradient: Gradient {
           GradientStop {
               position: 0.0; color: "#7c7c85" }

           GradientStop {
               position: 1.0; color: "#7f7878" }
       }

       Text {

            text: "Calories"
            width:80
            anchors.top: parent.top
            anchors.topMargin: 4
            font.bold: true
            font.family: "Helvetica"
            color:"white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 9
         text:calories
         font.pixelSize: 15
         font.family: "Helvetica"
         color:"white"
       width: 80
       horizontalAlignment: Text.AlignHCenter

        }
        }

        Rectangle{width:80
        height:50
        x:80
        anchors.bottom: parent.bottom
         gradient: Gradient {
             GradientStop {
                 position: 0.0; color: "#7c7c85" }

             GradientStop {
                 position: 1.0; color: "#7f7878" }
         }

        Text {

            text: "Time"
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.family: "Helvetica"
            color:"white"
           width:80
            anchors.top: parent.top
            anchors.topMargin: 4
        }
        Text {
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 9
         text:time + " mi"
         width:80
         horizontalAlignment: Text.AlignHCenter

         font.pixelSize: 15
         font.family: "Helvetica"
         color:"white"


        }
        }
        Rectangle{width:80
        height:50
        x:160
        anchors.bottom: parent.bottom
         gradient: Gradient {
             GradientStop {
                 position: 0.0; color: "#7c7c85" }

             GradientStop {
                 position: 1.0; color: "#7f7878" }
         }

        Text {

            text: "Rating"
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.family: "Helvetica"
            color:"white"
            x:18
            anchors.top: parent.top
            anchors.topMargin: 4
        }
        Text {
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 9
         text:rating+".0"
         width:80
         horizontalAlignment: Text.AlignHCenter

         font.pixelSize: 15
         font.family: "Helvetica"
         color:"white"


        }

        }


        Rectangle{
            id:backButton
            parent:ing
            width:30
            height:15

            x:10
            y:5
            opacity:0.2
            radius:3
        }
        MouseArea{
            anchors.fill: backButton
             onClicked: flipable.flipped = !flipable.flipped
        }
        Text {

            anchors.centerIn: backButton
            text: "Back"
            font.letterSpacing: 1
            font.family: "Helvetica"
            font.pixelSize: 10
            color:"white"
            font.bold: true
            y:7
            x:10
        }
         }



    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
        angle: 0    // the default angle
    }

    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: flipable.flipped
    }

    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 500 }
    }



}

//   width:0
//   height:0
//   color:"white"
//x:34
//y:22
//RecImage{id:rimage}








//   WebView {id:directions
//      // anchors.centerIn: recipeimages
//       url: "http://www.maps.google.com"


//       x:parent.x
//       y:parent.y
//     visible:false
//     width:1280*0.85
//     height:768 - 76.8
//     anchors.fill:name


//   }
   states: [
       State {
           name: "loadPage"
           PropertyChanges {
               target: App2.goback
               visible:false


           }}]
//           PropertyChanges{
//           target:name
//           width:1280*0.85
//           height:768 - 76.8
//           x: xframe
//           y:0
//z:1
//           }
//           PropertyChanges{
//           target:title1
//         visible:false

//           }
//           PropertyChanges{
//           target:blackGradient
//           visible:false

//           }
////           PropertyChanges{
////           target:wall
////         interactive:false

////           }

//       }
//   ]
//   transitions: [
//       Transition {
//           from: ""
//           to: "loadPage"
//           NumberAnimation{properties: "opacity,width,height,x,y"


}
