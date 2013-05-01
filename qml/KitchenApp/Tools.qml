import QtQuick 2.0
Rectangle{
    property int selectLb: 1
    property int selectKg: 1
    property int selectG: 0
    property int selectOz: 0
    property int setMin;
    property int setSec;
    width:parent.width
    height:parent.height
    function calctime()
    {setMin = minutesTime.text
        setSec = secondsTime.text
        speaker.say("Timer set for" + setMin + "minutes, and "+ setSec + "seconds"   )

        console.log("dsF");
        console.log(minutesTime.text)
        var minutes = parseInt(minutesTime.text);
        secondsTime.visible = false;
        secondsStart.visible = true;
        minutesStart.visible = true;
        minutesTime.visible = false;



        var seconds = parseInt(secondsTime.text);

        var time = minutes*60 + seconds;
        console.log(time)
        theTimer.finaltime = time;

        theTimer.start()

    }
    function calctimeRem(sec,i,min,k,j)
    {

        if(secondsStart.text == 00)
        {
            min--


            sec = 60
        }
        if((sec<11)/*&&(k!=2)*/)
        {

            secondsStart.text = '0'+(sec - 1);
                k++

        }

        else
        {secondsStart.text = sec - 1;}
        if((min<10)/*&&(j!=2)*/)
        {if(min.length < 2)
            {minutesStart.text = '0' + min;}
            else
            {
                if(sec == 60)
                {minutesStart.text = '0'+min}
                else
                {
                    minutesStart.text = min
                }
            }
        j++;}
        else
        {
            minutesStart.text = min
        }

//        if((min == 0)&&(sec == 1))
//        {
//            minutesTime.visible = true
//            secondsTime.visible = true
//            secondsStart.visible = false;
//            minutesStart.visible = false;
//        }
    }

Rectangle//timer
{
    Text
    {

        text: qsTr("Timer") + tr.emptyString
        anchors.horizontalCenter: parent.horizontalCenter
        color:"white"
        font.pixelSize: parent.width/8
        anchors.top:parent.top
        anchors.topMargin: 0

    }




    width: parent.width/2;
       height: parent.height;
    gradient: Gradient {
        GradientStop {
            position: 0.0; color: "#7c7c85" }

        GradientStop {
            position: 1.0; color: "#25242a" }
        }
    Rectangle{
    anchors.centerIn: parent
    width:parent.width
    height:parent.width

    color:"transparent"

//    gradient: Gradient {
//        GradientStop {
//            position: 0.0; color: "#7c7c85" }

//        GradientStop {
//            position: 1.0; color: "#25242a" }
//        }
    radius:parent.width

TextInput
{

    anchors.centerIn: parent
    width:parent.width
    height:parent.height

   TextInput
   {id:minutesTime
       font.family: "DS-Digital"
       anchors.top:parent.top
       anchors.left: parent.left
       anchors.topMargin: parent.height*0.39
       anchors.leftMargin:parent.width*0.20
focus:true
       text:"00"
          color:"white"
       font.pixelSize: parent.height/4.38
       visible: true
   }
   Text
   {id:minutesStart
       font.family: "DS-Digital"
anchors.top:parent.top
anchors.left: parent.left
anchors.topMargin: parent.height*0.39
anchors.leftMargin:parent.width*0.20

visible: false
text:minutesTime.text

          color:"white"
       font.pixelSize: parent.height/4.38

   }
   TextInput
   {anchors.centerIn: parent
       font.family: "DS-Digital"

       text:":"
          color:"white"
       font.pixelSize: parent.height/4.38
       readOnly: true
   }
   TextInput
   {id:secondsTime
       font.family: "DS-Digital"
       anchors.top:parent.top
       anchors.left: parent.left
       anchors.topMargin: parent.height*0.39
       anchors.leftMargin:parent.width*0.55
visible: true
   color:"white"
       text:"00"
       font.pixelSize: parent.height/4.38
   }
   Text
   {id:secondsStart
       font.family: "DS-Digital"
       anchors.top:parent.top
       anchors.left: parent.left
       anchors.topMargin: parent.height*0.39
       anchors.leftMargin:parent.width*0.55
visible:false
text:secondsTime.text
          color:"white"
       font.pixelSize: parent.height/4.38

   }
    //color:"#10E044"

}

Button3
{anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottomMargin: parent.height/4.95

    width:1.6*parent.width/7.68
    height:0.8*parent.width/7.68
    bText: "SET"
    MouseArea{
    anchors.fill: parent
    onClicked:


        calctime();



    }

}
    Text
    {
        opacity: 0
        id:timeleft
        anchors.centerIn: parent
        font.family: "DS-Digital"
        text:"4"
        font.pixelSize: parent.height/4.38
        color:"#10E044"
        font.italic: true
    }
    }


Canvas {
    anchors.centerIn: parent
    property int i: 1
    id: canvas;
    width:parent.width
    height:parent.width
    contextType: "2d";
    renderStrategy: Canvas.Threaded;
    renderTarget: Canvas.Image;
    antialiasing: true;
    smooth: true;



    onPaint: {
        var k = 1;
        var j = 1;

        if(i<=theTimer.finaltime + 1)
           { context.clearRect (0, 0, width, height);
            context.beginPath ();
//            context.moveTo (width / 2, height / 2);
            context.arc (width / 2, height / 2,
                       0.95* width/2,
                         0,
                         angle * Math.PI / 180,
                         false);
            //context.closePath ();
           // context.fillStyle = "red";
            //context.fill ();
            context.strokeStyle = "#10E044";
        context.lineWidth = "10"
                 context.stroke();
            if(i>1)
       {calctimeRem(secondsStart.text,i,minutesStart.text,k,j);}

k++;
            j++;
            i++;}
        else{context.clearRect (0, 0, width, height);}


    }

   property real angle : 0;

    Timer {
        id:theTimer
        property real finaltime;

        interval: 1000;
        repeat: true;
        running: false;
        onTriggered: {
            console.log("dsFee")

            // update your angle property as you want
            canvas.angle = (canvas.angle < 360 ? canvas.angle + 360/finaltime : 0);


            {canvas.requestPaint ();}

        }
    }

    }
}
Rectangle//converter
{  id:convRect
    anchors.right:parent.right
    width:parent.width/2
    height:parent.height
    gradient: Gradient {
        GradientStop {
            position: 0.0; color: "#7c7c85" }

        GradientStop {
            position: 1.0; color: "#25242a" }
        }
    Rectangle
    {
        width:1
        height:parent.height
        color:"black"
        anchors.left: parent.left

    }
    Text
    {

        text: qsTr("Converter") + tr.emptyString
        anchors.horizontalCenter: parent.horizontalCenter
        color:"white"
        font.pixelSize: parent.width/8
        anchors.top:parent.top
        anchors.topMargin: 0

    }
    Rectangle
    {id:inpLeft
      anchors.left: parent.left
      anchors.top:parent.top
      anchors.leftMargin: 0.13*parent.width
      anchors.topMargin: 0.33*parent.height
    color:"white"
    width:0.373*parent.width
    height:0.25*parent.height
    }
    Rectangle
    {id:inpRight
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.leftMargin: 0.53*parent.width
        anchors.topMargin: 0.33*parent.height
        color:"white"
        width:0.373*parent.width
        height:0.25*parent.height
    }
    Rectangle
    {id:baseline
        width:parent.width
        height:2
        color:"#00CC00"
        anchors.top:parent.top
        anchors.topMargin: 0.2*parent.height

    }
    Rectangle
    {
        id:line1
        width:parent.width/2
        height:5
        color:"#00CC00"
        anchors.bottom:baseline.top
       // anchors.topMargin: 0.18*parent.height

    }

    Text {
        id: name1
        text: qsTr("WEIGHT")
        font.family: "Helvetica"

font.bold: true
        anchors.top: parent.top
        anchors.topMargin:0.13*parent.height
        anchors.left: parent.left
        anchors.leftMargin: 0.14*parent.width


        font.pixelSize: 0.06*parent.width
        color:"#00CC00"
        MouseArea{anchors.fill: parent
        onClicked: {

            convRect.state = ""
        }
        }
    }
    Text {
        id: name2
        text: qsTr("VOLUME")
        font.family: "Helvetica"
 font.pixelSize: 0.06*parent.width

        anchors.top: parent.top
        anchors.topMargin:0.13*parent.height
        anchors.left: parent.left
        anchors.leftMargin: 0.64*parent.width
        color:"#00CC00"
        MouseArea{
            anchors.fill: parent
         onClicked: {
          convRect.state = "volume"
        }
        }
    }


    VirtualInput
    {   id:input
        anchors.fill: inpLeft
       anchors.top:parent.top
       anchors.topMargin: 0.15*inpLeft.height
       anchors.leftMargin: 0.1*inpLeft.width
       border.color: "white"

        fontSize: 0.6*inpLeft.height
    }
    VirtualInput
    {
        id:output
        anchors.fill: inpRight
       anchors.top:parent.top

         border.color: "white"
       anchors.topMargin: 0.15*inpLeft.height
         fontSize: 0.6*inpLeft.height
    }

    Rectangle{
       id:selector
       width:parent.width/8.5
       height:parent.width/20
       radius:parent.width
       anchors.top:parent.top
       anchors.left: parent.left
       anchors.topMargin: 0.67*parent.height
        anchors.leftMargin: 0.16*parent.width
        color:"#00CC00"

    }
    Rectangle{
       id:selector1
       width:parent.width/8.5
       height:parent.width/20
       radius:parent.width
       anchors.top:parent.top
       anchors.left: parent.left
       anchors.topMargin: 0.67*parent.height
        anchors.leftMargin: 0.56*parent.width
        color:"#00CC00"

    }
Button3
{
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0.15*parent.height
    width:0.34*parent.width
    height:0.07*parent.height
    bText: "Convert"
    MouseArea
    {
        anchors.fill: parent
        onClicked: {
            if(convRect.state == "")
            {

                if((selectKg == 1)&&(selectLb == 1))
                {
                    var kgval = parseFloat(input.currentText);
                    var lbval = parseFloat(output.currentText);
                    output.currentText = 2.2*kgval
                }
                else if((selectKg == 1)&&(selectOz == 1))
                {console.log("kgtooz")}
                else if((selectG == 1)&&(selectLb == 1))
                {console.log("gtolb")}
                else if((selectG == 1)&&(selectOz == 1))
                {console.log("gtooz")}

            }
            else if (convRect.state == "volume")
            {console.log("2")}
        }
    }
}
    Text
    {id:unit3
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.topMargin: 0.67*parent.height
         anchors.leftMargin: 0.6*parent.width
         text:"lb."
         font.pixelSize: 0.75*selector.height
         anchors.verticalCenter: selector.verticalCenter
         font.bold: true
         color:"white"
         MouseArea
         {
             anchors.fill: parent
             onClicked: {
                 selector1.anchors.leftMargin=0.769*selector1.anchors.leftMargin
             console.log(parent.width)
                 selectLb = 1
                 selectOz = 0
             }
         }
    }

    Text
    {id:unit4
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.topMargin: 0.67*parent.height
         anchors.leftMargin: 0.75*parent.width
         text:"oz."
         font.pixelSize: 0.75*selector.height
         anchors.verticalCenter: selector.verticalCenter
         font.bold: true
         color:"white"
         MouseArea
         {
             anchors.fill: parent
             onClicked: {


                 selector1.anchors.leftMargin=1.3*selector1.anchors.leftMargin
             console.log(parent.width)
                  selectOz = 1
                 selectLb = 0
             }
         }
    }

    Text
    {id:unit1
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.topMargin: 0.67*parent.height
         anchors.leftMargin: 0.19*parent.width
         text:"kg."
         font.pixelSize: 0.75*selector.height
         anchors.verticalCenter: selector.verticalCenter
         font.bold: true
         color:"white"
         MouseArea
         {
             anchors.fill: parent
             onClicked:
             {selector.anchors.leftMargin=0.5*selector.anchors.leftMargin
             console.log(parent.width)
                 selectKg = 1
                selectG = 0
             }
         }
     }
    Text
    {id:unit2
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.topMargin: 0.67*parent.height
         anchors.leftMargin: 0.36*parent.width
         text:"g."
         font.pixelSize: 0.75*selector.height
         anchors.verticalCenter: selector.verticalCenter
         font.bold: true
         color:"white"
         MouseArea
         {
             anchors.fill: parent
             onClicked: {selector.anchors.leftMargin=2*selector.anchors.leftMargin
             console.log(parent.width)
                 selectKg = 0
                selectG = 1
             }
         }
     }
    states: [
        State {
            name: "volume"
            PropertyChanges {
                target: line1
                x:line1.width
            }
            PropertyChanges{
            target:name2
            font.bold: true
            }
            PropertyChanges{
            target:name1
            font.bold: false
            }
            PropertyChanges{
            target:unit1
            text:"pint"
            }
            PropertyChanges{
            target:unit1
            text:"fl.oz"
            }
            PropertyChanges{
            target:unit3
            text: "ml."
            }
            PropertyChanges{
            target:unit4
            text: "l."
            }
        }
    ]
    transitions: [
        Transition {

            from: ""
            to: "volume"
            NumberAnimation{properties: "x"
                duration: 200

        }},
        Transition{
            from: "volume"
            to:""
            NumberAnimation{properties: "x"
                duration: 200

        }

        }]

}
}
