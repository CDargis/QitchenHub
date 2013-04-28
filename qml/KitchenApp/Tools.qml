import QtQuick 2.0
Rectangle{
    width:parent.width
    height:parent.height
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
    function calctime()
    {
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
{   anchors.right:parent.right
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
        anchors.leftMargin: 1
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
    {
      anchors.left: parent.left
      anchors.top:parent.top
      anchors.leftMargin: 0.2*parent.width
      anchors.topMargin: 0.25*parent.height
    color:"white"
    width:0.3*parent.width
    height:0.3*parent.height
    }
    Rectangle{}
}
}
