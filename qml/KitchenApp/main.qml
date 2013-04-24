import QtQuick 2.0
import TTSVoice 1.0
import "Indicator"
import "Organizer"
import "VirtualKeyboard"

Rectangle {
    id: theMainApplication  // For accessing globals, etc

    Component.onCompleted: {
        var func1 = "function doIt() {console.log('hey from first notification')}"
        var func2 = "function doIt() {console.log('hey from second notification')}"
        statusBar.setCurrentScreenTitle("Qitchen Hub")
        statusBar.addNotification({"title": "Notification 1", "message": "something happening", "func": func1})
        statusBar.addNotification({"title": "Notification 2", "message": "hi there!", "func": func2})
        speaker.say("Welcome my pedigree chums!");
    }

    // Define globals here ... at least for now
    property string fontFamily: "Sans"
    property string language: "en"
    property string currentUnits: "us"  // "eu" for metric, "us" for imperial
    property string currentLocation: "Chicago, IL"
    property Item speaker: statusBar.speakerRef()
    property bool playMusicOnStartup: true
    property bool musicRecommendations: true

    onLanguageChanged: {
        // Call the C++ handler to adjust the language
        tr.changeTranslation(language)
         // Iterate through each active app, and let it know it changed languages
        var index
        for(index = 0; index < appgrid.activeList.length; index++)
            if(appgrid.activeList[index] !== 0)
                appgrid.activeList[index].languageChange(language)
    }

    onCurrentUnitsChanged: {
        // Iterate through each active app, and call the change units signal
        var index
        for(index = 0; index < appgrid.activeList.length; index++)
            if(appgrid.activeList[index] !== 0)
              appgrid.activeList[index].changeUnits(currentUnits)
    }

    LocalSorageProxy {
        id: lsproxy
    }

    Image {
        anchors.fill: parent
        source: "qrc:/images/wallpaper.jpg"
        width: parent.width
    }

    // apps are parented to this item so they are able to use anchors
    Item {
        id: desktop
        anchors.top: statusBar.bottom
        width: parent.width * 0.85
        height: parent.height - desktop.y;

        // placeholder defining the area containing buttons
        AppGrid {
            id: appgrid
            /******************** static layer **************************/
            // if a button is meant to launch an app, make sure it behaves
            // like the template right below
            // also each button has to explicitly state it's size
            // and it better be that all buttons have the same size
            Button {
                id: homeAutomationButton
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Home Automation") + tr.emptyString
                // make sure you put the name of your qml as an argument
                onButtonClick: launch("HomeAutomation.qml",0)
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
                    onClicked: launch("Organizer.qml",1)
                }
            }
            Button {
                id: socialAppLauch
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Social App") + tr.emptyString

                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    onClicked: launch("SocialFeed.qml",2)
                }
            }
            Button {
                id: musicPlayerLaunch
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Music Player") + tr.emptyString

                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    onClicked: launch("MusicPlayer.qml",3)
                }
            }
            Button {
                id: weatherAppLaunch
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Weather") + tr.emptyString

                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    //onClicked: launch(".qml",3)
                }
            }
            Button {
                id: kitchenAppLaunch
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Kitchen") + tr.emptyString

                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    //onClicked: launch(".qml",3)
                }
            }
            Button {
                id: transitAppLaunch
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Traffic") + tr.emptyString

                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    onClicked: launch("Traffic.qml",4)
                }
            }
            Button {
                id: pictureViewerLaunch
                width: 200
                height: 200
                pointSize: 18
                buttonText: qsTr("Picture Viewer") + tr.emptyString

                MouseArea {
                    anchors.fill: parent
                    // make sure you put the name of your qml as an argument
                    //onClicked: launch(".qml",3)
                }
            }
        }

        /************* dynamic layer *************************/
        // just an abstract placeholder but as a matter of fact
        // all apps end up right here
    }

    StatusBar {
        id: statusBar
        usrName: "Steve"
        usrPicSource: "qrc:/images/user.png"
        currentScreenTitle: "QitchenHub"
    }
    Rectangle{
        id: dockBackGround
        x: parent.width * 0.85
        width: parent.width - parent.width * 0.85
        height: parent.height+dock.contentHeight
        anchors.top: statusBar.bottom
        opacity: .45
        border.color: "#00FF00"
        color: "#25BA25"
    }
    Dock {
        id: dock
        x: parent.width * 0.85
        anchors.top: statusBar.bottom
        anchors.topMargin: 2
        width: parent.width - dock.x
        height: parent.height - dock.y
    }

    VirtualKeyboard {
        id: theKeyboard
        parent: theMainApplication    // Explicitly set to fill the screen
        visible: false
    }

    //************* launch an app ******************/
    // qmlComp - name (string) of local qml component to launch (i.e. myapp.qml)
    function launch(qmlComp,index)
    {
        console.log(appgrid.activeList[index]);
        if(appgrid.activeList[index] === 0){
            var component = Qt.createComponent(qmlComp);
            if(component.status === Component.Ready) {
                var app = component.createObject(desktop,{"appIndex": index});

                // register an app with the dock
                app.callWidget.connect(dock.createWidget);
                appgrid.activeList[index] = app;
            }
            else console.log(component.errorString());
        }
        else{
            appgrid.activeList[index].show();
            if (appgrid.activeList[index].widget !== null)
                appgrid.activeList[index].widget.terminate();
        }
    }

    // Function defintions -------------------------------------------------------

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
