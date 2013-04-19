import QtQuick 2.0

AppInterface{
    width: parent.width; height: parent.height
    property string font:"Helvetica"
    property int bottommar: -7
    property int yValue: 365

    function showRequestInfo(text) {


    }
    function showDegree(text) {//Display temp

        log1.text = log1.text + "\n" + text + "°" + "F"


    }
    function showDegreeC(text) {//Display temp in C

        logC1.text = logC1.text + "\n" + text + "°" + "C"


    }
    function showDetails(text) {//Display hi/low temp

        detail1.text = detail1.text + "\n" + text


    }
    function showDetailsC(text) {

        detailc1.text = detailc1.text + "\n" + text


    }

    function showprecip(text) {//Show precipitation

        detail41.text = detail41.text + "\n" + text


    }
    function showprecipfr(text) {//Show precipitation

        detail4fr1.text = detail4fr1.text + "\n" + text


    }
    function showDesc(text) {//Show weather description

        desc1.text = desc1.text + "\n" + text


    }
    function showDetails2(text) {

        details21.text = details21.text + "\n" + text


    }
    function showHumidity(text) {//show humidity

        humidetail1.text = humidetail1.text + "\n" + text


    }
    function showWindspeed(text) {//show wind speed

        winspeed1.text = winspeed1.text + "\n" + text


    }
    function showWindspeedkph(text) {

        winspeed1k.text = winspeed1k.text + "\n" + text


    }
    function showVisible(text) {//show visiblity

        visibledetail1.text = visibledetail1.text + "\n" + text



    }
    function showVisiblem(text)
    {
        visibledetail1m.text = visibledetail1m.text + "\n" + text
    }
    function showTime(text) {
        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();
        // timedetail.text = hours+":"+minutes
        if(minutes<10)
        {   timedetail1.text = hours+":0"+minutes}
        else{timedetail1.text = hours+":"+minutes}

    }
    function showPressure(text) {

        pressuredetail1.text = pressuredetail1.text + "\n" + text


    }
    function showCloudcover(text) {

        clouddetail1.text = clouddetail1.text + "\n" + text


    }
    function showDescfr(text) {

        descfr1.text = descfr1.text + "\n" + text


    }
    function showDetailsfr(text) {

        detailfr1.text = detailfr1.text + "\n" + text


    }
    function showDetailsfrC(text) {

        detailfrC1.text = detailfrC1.text + "\n" + text


    }




    function loaded(jsonObject)
    { showCloudcover(jsonObject.data.current_condition[0].cloudcover);
        showHumidity(jsonObject.data.current_condition[0].humidity + "%");
        showTime();
        showprecip("Precipitation : " + jsonObject.data.current_condition[0].precipMM + " mm");
        showprecipfr("Précipitation : " + jsonObject.data.current_condition[0].precipMM + " mm");
        showVisible(jsonObject.data.current_condition[0].visibility + " km");

        var v = 0.62*(parseInt(jsonObject.data.current_condition[0].visibility))

        showVisiblem(v+" mi");
        showWindspeedkph(jsonObject.data.current_condition[0].windspeedKmph + " kph");
        showPressure(jsonObject.data.current_condition[0].pressure + " Pa");
        showDegreeC(jsonObject.data.current_condition[0].temp_C);
        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();
        if((hours>17)||(hours<7))//decide whether to display day or night icons
        {var condnight = 1;}
        else
        {condnight = 0;}



        var wc = jsonObject.data.current_condition[0].weatherCode;
        console.log("dSF")
        console.log(wc);

        //Decide background image and weather icon aacording to weather description
        if(jsonObject.data.current_condition[0].weatherCode == 116)
        {if(condnight == 1)
            {weathericon1.source = "images/weathericons/PartlyCloudyNight.png"
                image11.source = "images/PartlyCloudyNight.png"}
            else
            {weathericon1.source = "images/weathericons/PartlyCloudyDay.png"
                image11.source = "images/PartlyCloudyDay.png"}


        }
        else if(jsonObject.data.current_condition[0].weatherCode == 119)
        {if(condnight == 1)
            {weathericon1.source = "images/weathericons/CloudyNight.png"
                image11.source = "images/CloudyNight.png"}
            else
            {weathericon1.source = "images/weathericons/CloudyDay.png"
                image11.source = "images/CloudyDay.png"}

        }
        else if(jsonObject.data.current_condition[0].weatherCode == 113)
        {if(condnight == 1)
            {weathericon1.source = "images/weathericons/ClearNight.png"
                image11.source = "images/ClearNight.png"}
            else
            {weathericon1.source = "images/weathericons/Clear Day.png"
                image11.source = "images/ClearDay.png"}


        }

        else if(wc == 368||wc == 371||wc == 323||wc == 326||wc == 329||wc == 227||wc == 230||wc == 332||wc == 335||wc == 338||wc == 395||wc == 392)
        {
            if(condnight == 1)
            {weathericon1.source = "images/weathericons/LightsnowNight.png"
                image11.source = "images/Snow.png"}
            else
            {weathericon1.source = "images/weathericons/LightsnowDay.png"
                image11.source = "images/Snow.png"}


        }
        else if(wc == 122)
        {weathericon1.source = "images/weathericons/20.png"
            image11.source = "images/Overcast.png"}
        else if(wc == 374||wc == 176||wc == 263||wc == 266||wc == 293||wc == 296||wc == 299||wc == 302||wc == 311||wc == 353||wc == 386||wc == 362)
        {

            weathericon1.source = "images/weathericons/09.png"
            image11.source = "images/Light Rain.png"
        }

        else if(wc == 377||wc == 305||wc == 308||wc == 356||wc == 314||wc == 359||wc == 389)
        { weathericon1.source = "images/weathericons/01.png"
            image11.source = "images/Heavy Rain.png"}
        else if(wc == 143)
        {weathericon1.source = "images/weathericons/23.png"
            image11.source = "images/Mist.png"}

        showDegree(jsonObject.data.current_condition[0].temp_F);
        //Display content in other language
        if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Partly Cloudy")
        { showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
            showDescfr("Partiellement Nuageux");}
        else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Overcast")
        {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
            showDescfr("Couvert");}
        else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Sunny")
        {showDesc("Clear");
            showDescfr("Ensoleillé");}
        else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Clear")
        {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
            showDescfr("Effacer");}
        else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Cloudy")
        {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
            showDescfr("Nuageux");}
        else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Light rain")
        {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
            showDescfr("Pluie");}
        else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Light snow")
        {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
            showDescfr("Neige légère");}
        else
        {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
            showDescfr(jsonObject.data.current_condition[0].weatherDesc[0].value);}
        showWindspeed(jsonObject.data.current_condition[0].windspeedMiles + " mph");
        showDetails2(jsonObject.data.current_condition[0].winddirDegree + "° " + jsonObject.data.current_condition[0].winddir16Point);
        showDetails("High/Low : " + jsonObject.data.weather[0].tempMaxF + "/"+jsonObject.data.weather[0].tempMinF+"°F");
        showDetailsC("High/Low : " + jsonObject.data.weather[0].tempMaxC + "/"+jsonObject.data.weather[0].tempMinC+"°C");
        showDetailsfr("Haut/Bas : " + jsonObject.data.weather[0].tempMaxF + "/"+jsonObject.data.weather[0].tempMinF+"°F");
        showDetailsfrC("Haut/Bas : " + jsonObject.data.weather[0].tempMaxC + "/"+jsonObject.data.weather[0].tempMinC+"°C");


    }

    Rectangle{id:newrec1//rectangle for the secondary location

        width: parent.width; height: parent.height




        Image {
            id:image11
            anchors.fill: parent

        }
        Image {
            id: image21
            anchors.centerIn: parent

            source: "images/CenterLabel.png"
            width:700
            height: 292
        }
        Image
        {id:footbar1
            source:"images/BotBar.tiff"
            anchors.bottom: parent.bottom
            width:parent.width
            opacity: 0.75
        }
        Text {
            id: log1;
            width: 350


            color: "#FFFFFF"
            font.pixelSize: 100
            font.family: font
            font.bold: true
            x:310
            y:240


            anchors.margins: 10
        }
        Image
        {
            id:weathericon1

            anchors.centerIn: image21
        }
        Text {//winddirection
            id: detail21

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:335




        }
        Text {//location
            id: detail31

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true
            text:city.text
            x:745
            y:420





        }
        Text{//preciptation
            id: detail41

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:430

        }

        Text
        {id: desc1

            //anchors.centerIn: weathericon
            // anchors.bottom: weathericon.bottom
            anchors.horizontalCenter: image21.horizontalCenter
            y:450
            color: "#FFFFFF"
            font.pixelSize: 20
            font.family: font
            //font.bold: true



        }

        Image{ id:precicon1
            source:"images/weathericons/12.png"
            x:717
            y:455
            width:20
            height:20


        }
        Image{ id:locicon1
            source:"images/lunapic_136037864284841_2.png"
            x:713
            y:420



        }

        Rectangle
        {
            id:switcher1
            y:50
            x:50
            width:170
            border.color: "white"
            color: "black"
            height: 30

            Text{id:switchtext1
                text:"<<Back"
                font.family: font
                font.pixelSize: 18
                font.bold: true

                anchors.centerIn: switcher1


                color:"white"
            }}
        MouseArea{//location switcher
            parent:switcher1
            anchors.fill: parent
            onClicked:
                //homerec.state == "" ? homerec.state = "changeloc" : homerec.state = ""
                if(homerec.state == "")
                {homerec.state = "changeloc";
                    /*homerec.state = "newin"*/}
                else
                {homerec.state = ""}


            //Define all relevant details,i.e. Room humidity,Temperature,visibility etc
        }
        Text
        {id:roomtemp1
            text: "Room Temp."
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 35

        }
        Text
        {id:roomtempfr1
            text: "Temp. ambiante"
            parent:footbar1
            opacity:0
            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 35

        }
        Text
        {id:roomhum1
            text: "Room Humidity"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 165

        }
        Text
        {id:roomhumfr1
            text: "L'humidité ambiante"
            parent:footbar1
            opacity: 0
            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 165

        }

        Text{id:roomtempval1
            text:"78°F"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 43

        }
        Text{id:roomtempvalC1
            text:"26°C"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 47
            opacity:0

        }
        Text{id:roomhumidity1

            text:"59%"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 180
        }
        Text{id:details21


            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 315
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: bottommar
        }
        Text{id:humidetail1


            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 600
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: bottommar
        }
        Text{id:timedetail1

            parent:footbar1


            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 850
          y:pressuredetail.y
        }
        Text{id:pressuredetail1

            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 990
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: bottommar}
        Text{id:clouddetail1

            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize:31
            anchors.left: footbar1.left
            anchors.leftMargin: 1140
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: -7}

        Text{id:winspeed1


            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 475
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: -7
        }
        Text{id:winspeed1k

            opacity: 0
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 475
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: -7
        }
        Text{id:visibledetail1


            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 710
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: -7
        }
        Text{id:visibledetail1m
            opacity: 0

            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar1.left
            anchors.leftMargin: 710
            anchors.bottom: footbar1.bottom
            anchors.bottomMargin: bottommar
        }
        Text
        {id:windir1
            text: "Wind Direction"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 310

        }
        Text
        {id:windirfr1
            text: "Direction du Vent"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 314
            opacity:0

        }
        Text
        {id:humid1
            text: "Humidity"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 600

        }
        Text
        {id:humidfr1
            text: "Humidité"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 600
            opacity:0

        }
        Text
        {id:windspeed1
            text: "Wind Speed"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 475


        }
        Text
        {id:windspeedfr1
            text: "Vitesse du vent"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 475
            opacity:0

        }

        Text
        {id:visibility1
            text: "Visibility"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 725


        }
        Text
        {id:visibilityfr1
            text: "Visibilité"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 725
            opacity:0

        }
        Text
        {id:time1
            text: "Obs. Time"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 850

        }
        Text
        {id:timefr1
            text: "Temps d'observation "
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 825
            opacity:0

        }
        Text
        {id:pressure1
            text: "Atm. Pressure"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 990

        }
        Text
        {id:pressurefr1
            text: "Pression Atm."
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 990
            opacity:0

        }
        Text
        {id:cloudcover1
            text: "Cloud Cover"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 1125

        }
        Text
        {id:cloudcoverfr1
            text: "Couverture Nuageuse"
            parent:footbar1

            color:"#FFFFFF"
            anchors.verticalCenter: footbar1.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar1.left
            anchors.leftMargin: 1120
            opacity:0

        }


        Text {
            id: logC1;
            width: 350


            color: "#FFFFFF"
            font.pixelSize: 100
            font.family: font
            font.bold: true
            x:310
            y:240


            anchors.margins: 10
            opacity: 0
        }




        Text {//hi lo temp
            id: detail1

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue





        }
        Text {//hi lo temp
            id: detailc1

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue

            opacity: 0



        }
        Text {//hi lo temp
            id: detailfr1

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue

            opacity: 0



        }
        Text {//hi lo temp
            id: detailfrC1

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue

            opacity: 0



        }




        Text{//preciptation
            id: detail4fr1

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true
            opacity: 0
            x:745
            y:430

        }


        Text
        {id: descfr1

            //anchors.centerIn: weathericon
            // anchors.bottom: weathericon.bottom
            anchors.horizontalCenter: image21.horizontalCenter
            opacity: 0

            y:450
            color: "#FFFFFF"
            font.pixelSize: 20
            font.family: font
            //font.bold: true



        }
        Image{ id:tempicon1
            source:"images/thermometer.png"
            x:710
            y:358 + 25
            width:30
            height:30



        }



        Text {
            id: city1
            text: "Milwaukee,WI"
            visible:false
        }
        Text {
            text:"Enter a city:"
            font.family: "Helvetica"
            font.pointSize: 12
            color: "#000000"
            id: enter_city1
            visible:false
        }
        Button2 {
            width: 60
            height :25
            id: go
            text: "Set"
            parent: settingsbox
            x:340
            y:100
            onClicked: {var a = city.text

                log1.text = ""
                detail1.text = ""
                detail41.text = ""
                desc1.text = ""
                descfr1.text = ""

                visibledetail1.text = ""
                visibledetail1m.text = ""
                details21.text = ""
                pressuredetail1.text = ""
                humidetail1.text = ""
                detail41.text = ""
                winspeed1.text = ""
                winspeed1k.text = ""
                clouddetail1.text = ""
                logC1.text = ""
                detailc1.text = ""
                detailfr1.text = ""
                detailfrC1.text = ""
                detail4fr1.text = ""//refreshing values for newly set location




                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                    if (doc.readyState == XMLHttpRequest.DONE) {
                        var jsonObject = eval('(' + doc.responseText + ')');
                        loaded(jsonObject);//calling json obj to retrieve weather
                    }
                }
                // Replace YOURPRIVATEKEY by your key from free.worldweatheronline.com
                doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city.text + "&format=json&num_of_days=2&key=640bc6c793043201130202");
                doc.send();}
        }
        Component.onCompleted: {
            log1.text = ""
            detail1.text = ""
            detail41.text = ""
            desc1.text = ""
            descfr1.text = ""
            var doc = new XMLHttpRequest();
            doc.onreadystatechange = function() {
                if (doc.readyState == XMLHttpRequest.DONE) {
                    var jsonObject = eval('(' + doc.responseText + ')');
                    loaded(jsonObject);
                }
            }
            // Replace YOURPRIVATEKEY by your key from free.worldweatheronline.com
            doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city1.text + "&format=json&num_of_days=2&key=640bc6c793043201130202");
            doc.send();

        }

    }

    Rectangle{id:homerec//home page

        width: parent.width; height: parent.height

        function showRequestInfo(text) {
            log.text = log.text + "\n" + text

        }
        function showDegree(text) {
            log.text = log.text + "\n" + text + "°" + "F"


        }
        function showDegreeC(text) {
            logC.text = logC.text + "\n" + text + "°" + "C"


        }
        function showDetails(text) {
            detail.text = detail.text + "\n" + text


        }
        function showDetailsC(text) {
            detailc.text = detailc.text + "\n" + text


        }

        function showprecip(text) {
            detail4.text = detail4.text + "\n" + text


        }
        function showprecipfr(text) {
            detail4fr.text = detail4fr.text + "\n" + text


        }
        function showDesc(text) {
            desc.text = desc.text + "\n" + text


        }
        function showDetails2(text) {
            details2.text = details2.text + "\n" + text


        }
        function showHumidity(text) {
            humidetail.text = humidetail.text + "\n" + text


        }
        function showWindspeed(text) {
            winspeed.text = winspeed.text + "\n" + text


        }

        function showWindspeedk(text) {
            winspeedk.text = winspeedk.text + "\n" + text


        }
        function showVisible(text) {
            visibledetail.text = visibledetail.text + "\n" + text


        }
        function showVisiblem(text)
        {
            visibledetailm.text = visibledetailm.text + "\n" + text
        }

        function showTime(text) {
            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            if(minutes<10)
            {   timedetail.text = hours+":0"+minutes}
            else{timedetail.text = hours+":"+minutes}


        }
        function showPressure(text) {
            pressuredetail.text = pressuredetail.text + "\n" + text


        }
        function showCloudcover(text) {
            clouddetail.text = clouddetail.text + "\n" + text


        }



        function showDescfr(text) {
            descfr.text = descfr.text + "\n" + text


        }
        function showDetailsfr(text) {
            detailfr.text = detailfr.text + "\n" + text


        }
        function showDetailsfrC(text) {
            detailfrC.text = detailfrC.text + "\n" + text


        }


        function loaded(jsonObject)
        {
            showCloudcover(jsonObject.data.current_condition[0].cloudcover);
            showHumidity(jsonObject.data.current_condition[0].humidity + "%");
            showTime();
            showprecip("Precipitation : " + jsonObject.data.current_condition[0].precipMM + " mm");
            showprecipfr("Précipitation : " + jsonObject.data.current_condition[0].precipMM + " mm");

            showPressure(jsonObject.data.current_condition[0].pressure + " Pa");
            //        showRequestInfo("temp_C:" + jsonObject.data.current_condition[0].temp_C);
            showDegree(jsonObject.data.current_condition[0].temp_F);
            showDegreeC(jsonObject.data.current_condition[0].temp_C);
            showVisiblem(0.62*(parseInt(jsonObject.data.current_condition[0].visibility))+" mi");

            //  showDegree(jsonObject.data.weather[0].tempMaxF);
            showVisible(jsonObject.data.current_condition[0].visibility + " km");
            //        showRequestInfo("weatherCode:" + jsonObject.data.current_condition[0].weatherCode);
            if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Partly Cloudy")
            { showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr("Partiellement Nuageux");}
            else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Overcast")
            {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr("Couvert");}
            else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Sunny")
            {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr("Ensoleillé");}
            else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Clear")
            {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr("Effacer");}
            else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Cloudy")
            {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr("Nuageux");}
            else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Light rain")
            {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr("Pluie");}
            else if(jsonObject.data.current_condition[0].weatherDesc[0].value == "Light snow")
            {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr("Neige légère");}
            else
            {showDesc(jsonObject.data.current_condition[0].weatherDesc[0].value);
                showDescfr(jsonObject.data.current_condition[0].weatherDesc[0].value);}

            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            if((hours>17)||(hours<7))
            {var condnight = 1;}
            else
            {condnight = 0;}



            var wc = jsonObject.data.current_condition[0].weatherCode;
console.log(wc);

            if(jsonObject.data.current_condition[0].weatherCode == 116)
            {if(condnight == 1)
                {weathericon.source = "images/weathericons/PartlyCloudyNight.png"
                    image1.source = "images/PartlyCloudyNight.png"}
                else
                {weathericon.source = "images/weathericons/PartlyCloudyDay.png"
                    image1.source = "images/PartlyCloudyDay.png"}


            }
            else if(jsonObject.data.current_condition[0].weatherCode == 119)
            {if(condnight == 1)
                {weathericon.source = "images/weathericons/CloudyNight.png"
                    image1.source = "images/CloudyNight.png"}
                else
                {weathericon.source = "images/weathericons/CloudyDay.png"
                    image1.source = "images/CloudyDay.png"}

            }
            else if(jsonObject.data.current_condition[0].weatherCode == 113)
            {if(condnight == 1)
                {weathericon.source = "images/weathericons/ClearNight.png"
                    image1.source = "images/ClearNight.png"}
                else
                {weathericon.source = "images/weathericons/Clear Day.png"
                    image1.source = "images/ClearDay.png"}


            }

            else if(wc == 323||wc == 326||wc == 329||wc == 332||wc == 335||wc == 338||wc == 395||wc == 392||wc == 179)
            {console.log("cdadDD")
                if(condnight == 1)
                {weathericon.source = "images/weathericons/LightsnowNight.png"
                    image1.source = "images/Snow.png"}
                else
                {weathericon.source = "images/weathericons/LightsnowDay.png"
                    image1.source = "images/Snow.png"}


            }
            else if(wc == 122)
            {weathericon.source = "images/weathericons/20.png"
                image1.source = "images/Overcast.png"}
            else if(wc == 176||wc == 284||wc == 350||wc == 281||wc == 317||wc == 263||wc == 266||wc == 293||wc == 296||wc == 299||wc == 302||wc == 311||wc == 353||wc == 386||wc == 362||wc == 182||wc == 185)
            {

                weathericon.source = "images/weathericons/09.png"
                image1.source = "images/Light Rain.png"
            }

            else if(wc == 305||wc == 365||wc == 248||wc == 320||wc == 260||wc == 308||wc == 356||wc == 314||wc == 359||wc == 389||wc == 200)
            { weathericon.source = "images/weathericons/01.png"
                image1.source = "images/Heavy Rain.png"}
            else if(wc == 143)
            {weathericon.source = "images/weathericons/23.png"
                image1.source = "images/Mist.png"}


            showDetails("High/Low : " + jsonObject.data.weather[0].tempMaxF + "/"+jsonObject.data.weather[0].tempMinF+"°F");
            showDetailsC("High/Low : " + jsonObject.data.weather[0].tempMaxC + "/"+jsonObject.data.weather[0].tempMinC+"°C");
            showDetailsfr("Haut/Bas : " + jsonObject.data.weather[0].tempMaxF + "/"+jsonObject.data.weather[0].tempMinF+"°F");
            showDetailsfrC("Haut/Bas : " + jsonObject.data.weather[0].tempMaxC + "/"+jsonObject.data.weather[0].tempMinC+"°C");

            showWindspeed(jsonObject.data.current_condition[0].windspeedMiles + " mph");
            showWindspeedk(jsonObject.data.current_condition[0].windspeedKmph + " kph");

            showDetails2(jsonObject.data.current_condition[0].winddirDegree + "°" + jsonObject.data.current_condition[0].winddir16Point);


        }

        Image {
            id: image1
            anchors.fill: parent

        }
        Image
        {id:footbar//bottom bar
            source:"images/botbar.tiff"
            anchors.bottom: parent.bottom
            opacity: 0.75
            width:parent.width

        }
        //icons
        Image{id:thermometer
            source:"images/Thermometer.png"
            parent: footbar
            y:360+25
            anchors.left: footbar.left
            anchors.leftMargin: 12

            visible: false

        }
        Image{id:windirection
            source:"images/icon_gps.png"
            parent:footbar
            anchors.verticalCenter: footbar.verticalCenter
            anchors.left: footbar.left
            anchors.leftMargin: 320
            width:57
            height:42
            visible:false}
        Text
        {id:roomtemp
            text: "Room Temp."
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 35

        }
        Text
        {id:roomtempfr
            text: "Temp. ambiante"
            parent:footbar
            opacity:0
            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 35

        }
        Text
        {id:roomhum
            text: "Room Humidity"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 165

        }
        Text
        {id:roomhumfr
            text: "L'humidité ambiante"
            parent:footbar
            opacity: 0
            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize: 15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 165

        }

        Text{id:roomtempval
            text:"78°F"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 43

        }
        Text{id:roomtempvalC
            text:"26°C"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 47
            opacity:0

        }
        Text{id:roomhumidity

            text:"59%"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 180
        }
        Text{id:details2


            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 315
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar
        }
        Text{id:humidetail


            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 600
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar
        }
        Text{id:timedetail

            parent:footbar


            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 850
            y:pressuredetail.y
        }
        Text{id:pressuredetail

            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 990
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar}
        Text{id:clouddetail

            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize:31
            anchors.left: footbar.left
            anchors.leftMargin: 1140
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar}

        Text{id:winspeed


            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 475
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar
        }

        Text{id:winspeedk

            opacity: 0
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 475
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar
        }
        Text{id:visibledetail


            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 710
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar
        }
        Text{id:visibledetailm


            opacity: 0
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font

            font.pixelSize: 31

            anchors.left: footbar.left
            anchors.leftMargin: 710
            anchors.bottom: footbar.bottom
            anchors.bottomMargin: bottommar
        }
        Text
        {id:windir
            text: "Wind Direction"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 310

        }
        Text
        {id:windirfr
            text: "Direction du Vent"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 314
            opacity:0

        }
        Text
        {id:humid
            text: "Humidity"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 600

        }
        Text
        {id:humidfr
            text: "Humidité"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 600
            opacity:0

        }
        Text
        {id:windspeed
            text: "Wind Speed"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 475


        }
        Text
        {id:windspeedfr
            text: "Vitesse du vent"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 475
            opacity:0

        }

        Text
        {id:visibility
            text: "Visibility"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 725


        }
        Text
        {id:visibilityfr
            text: "Visibilité"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 725
            opacity:0

        }
        Text
        {id:time
            text: "Obs. Time"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 850

        }
        Text
        {id:timefr
            text: "Temps d'observation "
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 825
            opacity:0

        }
        Text
        {id:pressure
            text: "Atm. Pressure"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 990

        }
        Text
        {id:pressurefr
            text: "Pression Atm."
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 990
            opacity:0

        }
        //     MouseArea{id:alert2
        //     Image {
        //         id: alert
        //         source: "images/alert.png"
        //         x:10
        //         y:10
        //         width:45
        //         height: 45
        //     }
        MouseArea
        {
            id:alert
            x:10
            y:10
            //     anchors.horizontalCenter: parent.right
            //     anchors.horizontalCenterOffset: -25
            Image {
                //         id: settingicon
                //         source: "images/system_config_services.png"
                //         width:40
                //         height:40
                //         parent:switcher2
                //         anchors.verticalCenter: parent.verticalCenter
                //         anchors.horizontalCenter: parent.horizontalCenter
                //         anchors.horizontalCenterOffset: -4
                id: alertimage
                source: "images/alert.png"

                width:45
                height: 45

            }

            width:70
            height:60
            opacity:1
            onClicked:
            { alertdetail.state == "" ? alertdetail.state = "alertstate" : alertdetail.state = ""}



        }

        //     onClicked: alertdetail.visible = "true"}

        Text
        {id:cloudcover
            text: "Cloud Cover"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 1125

        }
        Text
        {id:cloudcoverfr
            text: "Couverture Nuageuse"
            parent:footbar

            color:"#FFFFFF"
            anchors.verticalCenter: footbar.verticalCenter
            font.family: font
            font.bold: true
            font.pixelSize:15
            anchors.verticalCenterOffset: -28
            anchors.left: footbar.left
            anchors.leftMargin: 1125
            opacity:0

        }

        Image {
            id: image2
            anchors.centerIn: parent

            source: "images/CenterLabel.png"
            width:700
            height: 292
        }
        Text {
            id: log;
            width: 350


            color: "#FFFFFF"
            font.pixelSize: 100
            font.family: font
            font.bold: true
            x:310
            y:240


            anchors.margins: 10
        }
        Text {
            id: logC;
            width: 350


            color: "#FFFFFF"
            font.pixelSize: 100
            font.family: font
            font.bold: true
            x:310
            y:240


            anchors.margins: 10
            opacity: 0
        }
        Image
        {
            id:weathericon
            // source:"images/weathericons/image11"
            anchors.centerIn: parent
        }




        Text {//hi lo temp
            id: detail

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue





        }
        Text {//hi lo temp
            id: detailc

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue

            opacity: 0



        }
        Text {//hi lo temp
            id: detailfr

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue

            opacity: 0



        }
        Text {//hi lo temp
            id: detailfrC

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:yValue

            opacity: 0



        }

        Text {//winddir
            id: detail2

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:335




        }
        Text {//location
            id: detail3

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true
            text:city_label.text
            x:745
            y:420





        }
        Text{//preciptation
            id: detail4

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true

            x:745
            y:430

        }

        Text{//preciptation
            id: detail4fr

            color: "#FFFFFF"
            font.pixelSize: 18
            font.family: font
            font.bold: true
            opacity: 0
            x:745
            y:430

        }

        Text
        {id: desc

            //anchors.centerIn: weathericon
            // anchors.bottom: weathericon.bottom
            anchors.horizontalCenter: image2.horizontalCenter


            y:450
            color: "#FFFFFF"
            font.pixelSize: 20
            font.family: font
            //font.bold: true



        }
        Text
        {id: descfr

            //anchors.centerIn: weathericon
            // anchors.bottom: weathericon.bottom
            anchors.horizontalCenter: image2.horizontalCenter
            opacity: 0

            y:450
            color: "#FFFFFF"
            font.pixelSize: 20
            font.family: font
            //font.bold: true



        }
        Image{ id:tempicon
            source:"images/thermometer.png"
            x:710
            y:360+25
            width:30
            height:30



        }
        Image{ id:precicon
            source:"images/weathericons/12.png"
            x:717
            y:455
            width:20
            height:20


        }
        Image{ id:locicon
            source:"images/lunapic_136037864284841_2.png"
            x:713
            y:420



        }


        Rectangle
        {
            id:switcher
            y:400
            x:1000
            width:200
            border.color: "white"
            color: "black"
            height: 30

            Text{id:switchtext
                text:"Switch Location >>"
                font.family: font
                font.pixelSize: 18
                font.bold: true

                anchors.centerIn: switcher


                color:"white"
            }}
        MouseArea{
            parent:switcher
            anchors.fill: parent
            onClicked:
                //homerec.state == "" ? homerec.state = "changeloc" : homerec.state = ""
                if(homerec.state == "")
                {homerec.state = "changeloc";
                    /*homerec.state = "newin"*/}
                else
                {homerec.state = ""}



        }
        MouseArea
        {
            id:switcher2
            anchors.horizontalCenter: parent.right
            anchors.horizontalCenterOffset: -25
            Image {
                id: settingicon
                source: "images/system_config_services.png"
                width:40
                height:40
                parent:switcher2
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -4
            }

            width:70
            height:60
            opacity:1
            onClicked:
                //homerec.state == "" ? homerec.state = "changeloc" : homerec.state = ""
                if(settingsbox.state == "")
                {settingsbox.state = "settings1";
                    /*homerec.state = "newin"*/}
            //else
            //{settingsbox.state = ""}



        }

        //Image {
        //    id:closeicon
        //    source: "images/close_icon.png"
        //    parent: settingsbox
        //   // anchors.right: settingsbox.right
        //    width: 20
        //    height: 20
        //}
        //MouseArea{id:closeclick
        //parent: closeicon
        //onClicked:
        //if(settingsbox.state == "settings1")
        //{settingsbox.state = "";}}

        states: [
            State {
                name: "changeloc"
                PropertyChanges {
                    target: homerec
                    opacity:0
                    x:1280



                }
            }
            //    State {
            //        name: "settings0"
            //        PropertyChanges {
            //            target: settingsbox
            //            opacity:0


            //        }
            //    },



        ]
        transitions: [
            Transition {
                //        from:""
                //        to:"newin"
                NumberAnimation{properties: "opacity,x"}

                // NumberAnimation { target: log; property: "x"; duration: 200; easing.type: Easing.InOutBounce }

            }/*,*/
            //    Transition {
            //        from:""
            //        to:"settings1"
            //        NumberAnimation{properties: "opacity"}

            //       // NumberAnimation { target: log; property: "x"; duration: 200; easing.type: Easing.InOutBounce }

            //    }


        ]

        Text {
            text:"Enter a city:"
            font.family: "Helvetica"
            font.pointSize: 12
            color: "#000000"
            id: enter_city
            visible:false
        }
        TextInput {
            width: 240
            id: city_label
            text: "Chicago,IL"
            font.family: "Helvetica"
            font.pointSize: 12
            color: "#000000"

            visible: false
        }



        Component.onCompleted: {
            log.text = ""
            console.log("\n")


            var doc = new XMLHttpRequest();
            doc.onreadystatechange = function() {
                if (doc.readyState == XMLHttpRequest.DONE) {
                    var jsonObject = eval('(' + doc.responseText + ')');
                    loaded(jsonObject);
                }
            }
            doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city_label.text + "&format=json&num_of_days=2&key=640bc6c793043201130202");
            doc.send();
        }


    }
    Rectangle {
        id: settingsbox//Designing the settings box

        Text{id:unitsystem
            text:"Units: "
            font.family: font
            font.pixelSize: 18
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 40
            font.bold: false
            anchors.top: settingsbox.top
            anchors.topMargin: 60
            color:"white"
        }
        Text{id:unitsystemfr
            text:"Unité:"
            font.family: font
            font.pixelSize: 18
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 40
            font.bold: false
            anchors.top: settingsbox.top
            anchors.topMargin: 60
            color:"white"
            opacity: 0
        }
        Text{id:title
            text: "Settings"
            parent:settingsbox
            anchors.horizontalCenter: settingsbox.horizontalCenter
            font.family: font
            font.pixelSize: 24
            color:"white"
            font.bold: true
        }
        Text{id:titlefr
            text: "Paramètres"
            parent:settingsbox
            anchors.horizontalCenter: settingsbox.horizontalCenter
            font.family: font
            font.pixelSize: 24
            color:"white"
            font.bold: true
            opacity: 0
        }
        Text{id:closebtn//close button
            text: "close"
            parent:settingsbox
            anchors.right: settingsbox.right
            anchors.rightMargin: 10
            anchors.top:settingsbox.top
            anchors.topMargin: 10
            font.family: font
            font.pixelSize:15
            color:"white"

        }
        Text{id:closebtnfr
            text: "fermer"
            parent:settingsbox
            anchors.right: settingsbox.right
            anchors.rightMargin: 10
            anchors.top:settingsbox.top
            anchors.topMargin: 10
            font.family: font
            font.pixelSize:15
            color:"white"
            opacity: 0

        }
        MouseArea{id:closebn
            anchors.fill: closebtn
            onClicked: {if(settingsbox.state == "settings1")
                {settingsbox.state = "";
                    /*homerec.state = "newin"*/}}
        }
        Text{id:citylabel
            text:"Second Location: "
            font.family: font
            font.pixelSize:18
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 40
            font.bold: false
            anchors.top: settingsbox.top
            anchors.topMargin: 100
            color:"white"
        }
        Text{id:citylabelfr
            text:"Lieu deuxième:"
            font.family: font
            font.pixelSize:18
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 40
            font.bold: false
            anchors.top: settingsbox.top
            anchors.topMargin: 100
            color:"white"
            opacity: 0
        }
        TextInput
        {id:city

            font.family: font
            width: 75
            height: 20
            font.pixelSize: 18
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 250
            font.bold: false
            anchors.top: settingsbox.top
            anchors.topMargin: 104
            color:"white"
            focus: true
            text: "Milwaukee,WI"

        }


        Rectangle{
            id:ur1
            border.color: "white"
            width:90
            height: 30
            parent:settingsbox
            anchors.left: settingsbox.left

            anchors.leftMargin: 100
            anchors.top: settingsbox.top
            anchors.topMargin: 60
            color: "black"
            Text{id:unitsystem1
                text:"Metric"
                font.family: font
                font.pixelSize: 18
                font.bold: true
                parent: ur1
                anchors.centerIn: parent


                color:"white"
            }
            Text{id:unitsystem1fr
                text:" Métrique"
                font.family: font
                font.pixelSize: 18
                font.bold: true
                parent: ur1

                opacity: 0
                anchors.left:ur1.left
                //anchors.leftMargin: 20

                color:"white"
            }
        }

        Rectangle{
            id:ur2
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 200

            anchors.top: settingsbox.top
            anchors.topMargin: 60
            border.color: "white"
            width:80
            height: 30
            color:"black"
            Text{id:unitsystem2
                text:"Imperial"
                font.family: font
                font.pixelSize: 18
                font.bold: true
                parent:ur2
                anchors.centerIn: ur2
                color:"white"
            }
            Text{id:unitsystem2fr
                text:"Impérial"
                font.family: font
                font.pixelSize: 18
                font.bold: true
                parent:ur2
                anchors.centerIn: ur2
                color:"white"
                opacity: 0
            }
        }


        MouseArea{id:unim1//metric
            parent:ur1
            anchors.fill: parent
            onClicked: {ur1.color = "white"
                unitsystem1.color = "black"
                ur2.color = "black"
                unitsystem2.color = "white"
                unitsystem1fr.color = "black"
                unitsystem2fr.color = "white"
                logC.opacity = 1
                log.opacity = 0
                visibledetail.opacity = 1
                visibledetail1.opacity = 1
                visibledetail1m.opacity = 0
                visibledetailm.opacity = 0
                roomtempvalC.opacity = 1
                roomtempval.opacity = 0
                logC1.opacity = 1
                log1.opacity = 0
                roomtempvalC1.opacity = 1
                roomtempval1.opacity = 0
                winspeedk.opacity = 1
                winspeed1k.opacity = 1
                winspeed.opacity = 0
                winspeed1.opacity = 0
                if(desc.opacity == 1)
                {detailc.opacity = 1

                    detail.opacity = 0
                    detailfrC.opacity = 0
                    detailfr.opacity = 0
                    detailc1.opacity = 1

                    detail1.opacity = 0
                    detailfrC1.opacity = 0
                    detailfr1.opacity = 0}
                else if(desc.opacity == 0)
                {detailc.opacity = 0

                    detailfr.opacity = 0

                    detailfrC.opacity = 1
                    detail.opacity = 0
                    detailc1.opacity = 0

                    detailfr1.opacity = 0

                    detailfrC1.opacity = 1
                    detail1.opacity = 0
                   }



            }
        }
        MouseArea{id:unim2//imperial
            parent:ur2
            anchors.fill: parent
            onClicked: {ur2.color = "white"
                unitsystem2.color = "black"
                ur1.color = "black"
                unitsystem1.color = "white"
                unitsystem1fr.color = "white"
                unitsystem2fr.color = "black"
                //applying changes as per selection
                log.opacity = 1
                logC.opacity = 0

                visibledetail.opacity = 0
                visibledetail1.opacity = 0
                visibledetail1m.opacity = 1
                visibledetailm.opacity = 1
                roomtempval.opacity = 1
                roomtempvalC.opacity = 0
                winspeedk.opacity = 0
                winspeed1k.opacity = 0
                winspeed.opacity = 1
                winspeed1.opacity = 1
                if(desc.opacity == 1)
                {detailc.opacity = 0
                    detail.opacity = 1
                    detailfr.opacity = 0
                    detailfrC.opacity = 0}
                else if(desc.opacity == 0)
                {detailc.opacity = 0
                    detailfr.opacity = 1
                    detail.opacity = 0
                    detailfrC.opacity = 0
                }
            }}

        Rectangle{
            id:lng1
            border.color: "white"
            width:80
            height: 30
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 135
            anchors.top: settingsbox.top
            anchors.topMargin: 140
            color: "black"
            Text{id:lngselect1
                text:"French"
                font.family: font
                font.pixelSize:18
                font.bold: true
                parent: lng1
                anchors.centerIn: parent


                color:"white"
            }}
        Rectangle{
            id:lng2
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 225

            anchors.top: settingsbox.top
            anchors.topMargin: 140
            border.color: "white"
            width:80
            height: 30
            color:"black"
            Text{id:lngselect2
                text:"English"
                font.family: font
                font.pixelSize:18
                font.bold: true
                parent:lng2
                anchors.centerIn: lng2
                color:"white"
            }
        }
        Rectangle{
            id:lng3
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 325

            anchors.top: settingsbox.top
            anchors.topMargin: 140
            border.color: "white"
            width:80
            height: 30
            color:"black"
            Text{id:lngselect3
                text:"German"
                font.family: font
                font.pixelSize:18
                font.bold: true
                parent:lng3
                anchors.centerIn: lng3
                color:"white"
            }
        }
        Rectangle{
            id:lng4
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 425

            anchors.top: settingsbox.top
            anchors.topMargin: 140
            border.color: "white"
            width:80
            height: 30
            color:"black"
            Text{id:lngselect4
                text:"Italian"
                font.family: font
                font.pixelSize:18
                font.bold: true
                parent:lng4
                anchors.centerIn: lng4
                color:"white"
            }
        }
        Rectangle{
            id:lng5
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 525

            anchors.top: settingsbox.top
            anchors.topMargin: 140
            border.color: "white"
            width:80
            height: 30
            color:"black"
            Text{id:lngselect5
                text:"Swahili"
                font.family: font
                font.pixelSize:18
                font.bold: true
                parent:lng5
                anchors.centerIn: lng5
                color:"white"
            }
        }

        MouseArea{id:lngm1
            parent:lng1
            anchors.fill: parent
            onClicked: {lng1.color = "white"
                lngselect1.color = "black"
                lng2.color = "black"
                lngselect2.color = "white"
                //applying changes as per selection
                descfr.opacity = 1
                desc.opacity = 0
                language.opacity = 0
                languagefr.opacity = 1
                roomtempfr.opacity = 1
                roomtemp.opacity = 0
                roomhum.opacity = 0
                roomhumfr.opacity = 1
                windir.opacity = 0
                windirfr.opacity = 1
                windspeed.opacity = 0
                windspeedfr.opacity = 1
                humid.opacity = 0
                humidfr.opacity = 1
                visibility.opacity = 0
                visibilityfr.opacity = 1
                time.opacity = 0
                timefr.opacity = 1
                pressure.opacity = 0
                pressurefr.opacity = 1
                cloudcover.opacity = 0
                cloudcoverfr.opacity = 1
                detailfr.opacity = 1
                detail.opacity = 0
                detail4fr.opacity = 1
                detail4.opacity = 0
                unitsystem.opacity = 0
                unitsystemfr.opacity = 1
                title.opacity = 0
                titlefr.opacity = 1
                closebtn.opacity = 0
                closebtnfr.opacity = 1
                citylabel.opacity = 0
                citylabelfr.opacity = 1
                unitsystem1.opacity = 0
                unitsystem2.opacity = 0
                unitsystem1fr.opacity = 1
                unitsystem2fr.opacity = 1
                detail4fr.opacity = 1
                detail4.opacity = 0
                if(logC.opacity == 1)
                {detailc.opacity = 0
                    detailfrC.opacity = 1
                    detailfr.opacity = 0
                    detail.opacity = 0}
                else if(logC.opacity == 0)
                {detailc.opacity = 0
                    detailfrC.opacity = 0
                    detailfr.opacity = 1
                    detail.opacity = 0}

                descfr1.opacity = 1
                desc1.opacity = 0
                alertext.opacity = 0
                alertextfr.opacity = 1
                closealert.opacity = 0
                closealertfr.opacity =1
                roomtempfr1.opacity = 1
                roomtemp1.opacity = 0
                roomhum1.opacity = 0
                roomhumfr1.opacity = 1
                windir1.opacity = 0
                windirfr1.opacity = 1
                windspeed1.opacity = 0
                windspeedfr1.opacity = 1
                humid1.opacity = 0
                humidfr1.opacity = 1
                visibility1.opacity = 0
                visibilityfr1.opacity = 1
                time1.opacity = 0
                timefr1.opacity = 1
                pressure1.opacity = 0
                pressurefr1.opacity = 1
                cloudcover1.opacity = 0
                cloudcoverfr1.opacity = 1
                detailfr1.opacity = 1
                detail1.opacity = 0
                detail4fr1.opacity = 1
                detail41.opacity = 0
                unitsystem.opacity = 0
                unitsystemfr.opacity = 1
                title.opacity = 0
                titlefr.opacity = 1
                closebtn.opacity = 0
                closebtnfr.opacity = 1
                citylabel.opacity = 0
                citylabelfr.opacity = 1
                unitsystem1.opacity = 0
                unitsystem2.opacity = 0
                unitsystem1fr.opacity = 1
                unitsystem2fr.opacity = 1
                detail4fr1.opacity = 1
                detail41.opacity = 0
                if(logC1.opacity == 1)
                {detailc1.opacity = 0
                    detailfrC1.opacity = 1
                    detailfr1.opacity = 0
                    detail1.opacity = 0}
                else if(logC1.opacity == 0)
                {detailc1.opacity = 0
                    detailfrC1.opacity = 0
                    detailfr1.opacity = 1
                    detail1.opacity = 0}


            }
        }
        MouseArea{id:langm2
            parent:lng2
            anchors.fill: parent
            onClicked: {lng2.color = "white"
                lngselect2.color = "black"
                lng1.color = "black"
                lngselect1.color = "white"

                languagefr.opacity = 0
                language.opacity = 1
                descfr.opacity = 0
                desc.opacity = 1
                roomtempfr.opacity = 0
                roomtemp.opacity = 1
                roomhum.opacity = 1
                roomhumfr.opacity = 0
                windir.opacity = 1
                windirfr.opacity = 0
                windspeed.opacity = 1
                windspeedfr.opacity = 0
                humid.opacity = 1
                humidfr.opacity = 0
                visibility.opacity = 1
                visibilityfr.opacity = 0
                time.opacity = 1
                timefr.opacity = 0
                pressure.opacity = 1
                pressurefr.opacity = 0
                cloudcover.opacity = 1
                cloudcoverfr.opacity = 0
                detailfr.opacity = 0
                detail.opacity = 1
                detail4fr.opacity = 0
                detail4.opacity = 1
                unitsystem.opacity = 1
                unitsystemfr.opacity = 0
                title.opacity = 1
                titlefr.opacity = 0
                closebtn.opacity = 1
                closebtnfr.opacity = 0
                citylabel.opacity = 1
                citylabelfr.opacity = 0
                unitsystem1.opacity = 1
                unitsystem2.opacity = 1
                unitsystem1fr.opacity = 0
                unitsystem2fr.opacity = 0
                detail4fr.opacity = 0
                detail4.opacity = 1

                if(logC.opacity == 1)
                {detailc.opacity = 1
                    detailfrC.opacity = 0
                    detailfr.opacity = 0
                    detail.opacity = 0}
                else if(logC.opacity == 0)
                {detailc.opacity = 0
                    detailfrC.opacity = 0
                    detailfr.opacity = 0
                    detail.opacity = 1}
                alertext.opacity = 1
                alertextfr.opacity = 0
                closealert.opacity = 1
                closealertfr.opacity =0
                languagefr.opacity = 0
                language.opacity = 1
                descfr1.opacity = 0
                desc1.opacity = 1
                roomtempfr1.opacity = 0
                roomtemp1.opacity = 1
                roomhum1.opacity = 1
                roomhumfr1.opacity = 0
                windir1.opacity = 1
                windirfr1.opacity = 0
                windspeed1.opacity = 1
                windspeedfr1.opacity = 0
                humid1.opacity = 1
                humidfr1.opacity = 0
                visibility1.opacity = 1
                visibilityfr1.opacity = 0
                time1.opacity = 1
                timefr1.opacity = 0
                pressure1.opacity = 1
                pressurefr1.opacity = 0
                cloudcover1.opacity = 1
                cloudcoverfr1.opacity = 0
                detailfr1.opacity = 0
                detail1.opacity = 1
                detail4fr1.opacity = 0
                detail41.opacity = 1
                unitsystem.opacity = 1
                unitsystemfr.opacity = 0
                title.opacity = 1
                titlefr.opacity = 0
                closebtn.opacity = 1
                closebtnfr.opacity = 0
                citylabel.opacity = 1
                citylabelfr.opacity = 0
                unitsystem1.opacity = 1
                unitsystem2.opacity = 1
                unitsystem1fr.opacity = 0
                unitsystem2fr.opacity = 0
                detail4fr1.opacity = 0
                detail41.opacity = 1

                if(logC1.opacity == 1)
                {detailc1.opacity = 1
                    detailfrC1.opacity = 0
                    detailfr1.opacity = 0
                    detail1.opacity = 0}
                else if(logC1.opacity == 0)
                {detailc1.opacity = 0
                    detailfrC1.opacity = 0
                    detailfr1.opacity = 0
                    detail1.opacity = 1}



            }}
        Text{id:language
            text:"Language: "
            font.family: font
            font.pixelSize:18
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 40
            font.bold: false
            anchors.top: settingsbox.top
            anchors.topMargin: 140
            color:"white"
        }
        Text{id:languagefr
            text:"Langue: "
            font.family: font
            font.pixelSize:18
            parent:settingsbox
            anchors.left: settingsbox.left
            anchors.leftMargin: 40
            font.bold: false
            anchors.top: settingsbox.top
            anchors.topMargin: 140
            color:"white"
            opacity: 0
        }


        width:0
        height:0
        opacity:0
        anchors.centerIn: parent
        color: "black"


        states: [
            State {
                name: "settings1"
                PropertyChanges {
                    target: settingsbox
                    opacity:1
                    width:640
                    height: 360

                }
            }
        ]
        transitions: [
            Transition {
                from: ""
                to: "settings1"
                NumberAnimation{properties: "opacity,width,height"}
            }
        ]



    }

    Rectangle{
        parent:homerec
        id:alertdetail
        opacity:0
        color: "black"
        width:450
        height:100
        anchors.centerIn: parent

        Text {
            id: alertext
            text:"ALERT:WIND ADVISORY"
            anchors.centerIn: alertdetail
            color:"white"
            font.pixelSize: 30
            font.family: font
        }
        Text {
            id: alertextfr
            text:"ALERTE: VENT CONSULATIF"
            anchors.centerIn: alertdetail
            color:"white"
            font.pixelSize: 30
            font.family: font
            opacity: 0
        }
        Text{id:closealert
            text: "close"
            parent:alertdetail
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top:parent.top
            anchors.topMargin: 10
            font.family: font
            font.pixelSize:15
            color:"white"

        }
        Text{id:closealertfr
            text: "fermer"
            parent:alertdetail
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top:parent.top
            anchors.topMargin: 10
            font.family: font
            font.pixelSize:15
            color:"white"
            opacity: 0

        }
        MouseArea{id:closeal
            anchors.fill: closealert
            onClicked: {if(alertdetail.state == "alertstate")
                {alertdetail.state = "";
                    /*homerec.state = "newin"*/}}
        }






        states: [
            State {
                name: "alertstate"
                PropertyChanges {
                    target: alertdetail
                    opacity:1


                }
            }

        ]
        transitions: [
            Transition {

                NumberAnimation{property: "opacity"}
            }
        ]


    }

}

