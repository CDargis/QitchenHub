import QtQuick 2.0
import TTSVoice 1.0
import "Indicator"
import "Organizer"

Rectangle {
    id: theMainApplication  // For accessing globals, etc

    Component.onCompleted: {
        var func1 = "function doIt() {console.log('hey from first notification')}"
        var func2 = "function doIt() {console.log('hey from second notification')}"
        statusBar.setCurrentScreenTitle("Qitchen Hub")
        statusBar.addNotification({"title": "Notification 1", "message": "something happening", "func": func1})
        statusBar.addNotification({"title": "Notification 2", "message": "hi there!", "func": func2})
        speaker.say("Welcome my pedigree chums!")
    }

    // Define globals here ... at least for now
    property string fontFamily: "Sans";
    property string language: "en"
    property string currentUnits: "us"  // "eu" for metric, "us" for imperial  // READ ONLY!!! USE setUnits()

    onLanguageChanged: {
        // Call the C++ handler to adjust the language
        tr.changeTranslation(language)
         // Iterate through each active app, and let it know it changed languages
        var index
        for(index = 0; index < appgrid.activeList.length; index++) {
            if(appgrid.activeList[index] !== 0)
                appgrid.activeList[index].languageChange(language)
        }
    }

    onCurrentUnitsChanged: {
        // Iterate through each active app, and call the change units signal
        var index
        for(index = 0; index < appgrid.activeList.length; index++) {
            if(appgrid.activeList[index] !== 0)
              appgrid.activeList[index].changeUnits(currentUnits)
        }
    }

    signal changeLangSignal(string lang)   // Signal for changing the language

    // apps are parented to this item so they are able to use anchors
    Item {
        id: desktop
        anchors.top: statusBar.bottom
        width: parent.width * 0.85
        height: parent.height - desktop.y;

        Voice {
            id: speaker
        }

        // placeholder defining the area containing buttons
        AppGrid {
            id: appgrid
            /******************** static layer **************************/
            // if a button is meant to launch an app, make sure it behaves
            // like the template right below
            // also each button has to explicitly state it's size
            // and it better be that all buttons have the same size
            Button {
                id: button
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Home Automation") + tr.emptyString
                // make sure you put the name of your qml as an argument
                onButtonClick: launch("HomeAutomation.qml")
            }

            ToggleSwitch {
                //anchors.left: button.right
                //anchors.leftMargin: 25
                //anchors.verticalCenter: button.verticalCenter
                isOn: false
            }

            Indicator {

            }

            AppHint {

            }

            Button {
                id: buttonOrg
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Calendar") + tr.emptyString

                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    onClicked: launch("Organizer.qml")
                }
            }
            DayItem {
                width: 125
                height: 125
            }
            Button {
                width: 125
                height: 125
            }
            Button {
                width: 125
                height: 125
            }
            Button {
                width: 125
                height: 125
            }
            Button {
                width: 125
                height: 125
            }
            Button {
                width: 125
                height: 125
            }
        }

        /************* dynamic layer *************************/
        // just an abstract placeholder but as a matter of fact
        // all apps end up right here
    }

    Dock {
        id: dock
        x: parent.width * 0.85
        y: parent.height * 0.1
        width: parent.width - dock.x
        height: parent.height - dock.y
    }
    StatusBar {
        id: statusBar
        usrName: "Chris"
        usrPicSource: "qrc:/images/user.png"
        currentScreenTitle: "QitchenHub"
    }

    //************* launch an app ******************/
    // qmlComp - name (string) of local qml component to launch (i.e. myapp.qml)
    function launch(qmlComp)
    {
        if(appgrid.activeList[0] === 0){
            var component = Qt.createComponent(qmlComp);
            if(component.status === Component.Ready) {
                var app = component.createObject(desktop);

                // register an app with the dock
                app.callWidget.connect(dock.createWidget);
                appgrid.activeList[0] = app;
            }
            else console.log(component.errorString());
        }
        else{
            appgrid.activeList[0].show();
            if (appgrid.activeList[0].widget !== null)
                appgrid.activeList[0].widget.terminate();
        }
    }

    // Function defintions -------------------------------------------------------

    // Call all apps that have units to change their units
    // This function ensures that we either go from celcius to FH, or FH to celcius
    function setUnits(units) {
        if(currentUnits.localeCompare(units) === 0)
            return    // Return if the property isn't changing
        if((units.localeCompare("eu") !== 0) && units.localeCompare("us") !== 0)
            return   // Return if invalid
        currentUnits = units
    }

    // Convert Celcius to FH
    function celciusToFH(celcius)
    {
        return Math.round(((9/5)*celcius + 32));
    }

    // Convert FH to Celcius
    function fHToCelcius(FH)
    {
        return Math.round(((5/9)*(FH - 32)));
    }
}
