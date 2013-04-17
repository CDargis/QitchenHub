import QtQuick 2.0

Rectangle {
    id: root
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width * 0.9
    height: 90
    radius: 10
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#777777" }
        GradientStop { position: 0.3; color: "#222222" }
    }

    Rectangle {
        id: screen
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.85
        color: "#000000"

        Image {
            id: dots
            anchors.centerIn: parent;
            height: screen.height * 0.90
            width: screen.width * 0.15
            source: "qrc:/images/lcd/dots.png"

            property bool shown: true
        }
        Image {
            id: second

            property int digit: 0

            anchors.top: dots.top
            anchors.right: dots.left
            height: screen.height * 0.90
            width: screen.width * 0.2
            source: "qrc:/images/lcd/" + digit + ".png"
        }
        Image {
            id: first

            property int digit: 0

            anchors.top: dots.top
            anchors.right: second.left
            height: screen.height * 0.90
            width: screen.width * 0.2
            source: "qrc:/images/lcd/" + digit + ".png"
        }
        Image {
            id: third

            property int digit: 0

            anchors.top: dots.top
            anchors.left: dots.right
            height: screen.height * 0.90
            width: screen.width * 0.2
            source: "qrc:/images/lcd/" + digit + ".png"
        }
        Image {
            id: fourth

            property int digit: 0

            anchors.top: dots.top
            anchors.left: third.right
            height: screen.height * 0.90
            width: screen.width * 0.2
            source: "qrc:/images/lcd/" + digit + ".png"
        }

        Timer {
            id: timer
            repeat: true
            interval: 60000

            onTriggered: {

                if (fourth.digit == 9) {
                    fourth.digit = 0;

                    if (third.digit == 5) {
                        third.digit = 0;

                        if (first.digit < 2 && second.digit == 9) {
                            second.digit = 0;
                            ++first.digit;
                        }
                        else if (first.digit == 2 && second.digit == 3) {
                            second.digit = 0;
                            first.digit = 0;
                        }
                        else
                            ++second.digit
                    }
                    else
                        ++third.digit;
                }
                else
                    ++fourth.digit;
            }
        }

        Timer {
            id: seconds
            repeat: true
            interval: 1000
            onTriggered: {

                dots.shown = !dots.shown;

                if (dots.shown)
                    dots.visible = true;
                else
                    dots.visible = false;
            }
        }
    }

    Component.onCompleted: {

        var date = new Date;

        var minutes = parseInt(date.getMinutes());
        var hours = parseInt(date.getHours());



        first.digit = Math.floor(hours * 0.1);
        console.log(first.digit);
        second.digit = hours - (first.digit * 10);
        console.log(second.digit);
        third.digit = Math.floor(minutes * 0.1);
        console.log(third.digit);
        fourth.digit = minutes - (third.digit * 10);
        console.log(fourth.digit);

        seconds.start();
        timer.start();
    }
}
