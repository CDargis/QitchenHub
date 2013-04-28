import QtQuick 2.0

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
      anchors.leftMargin: 0.16*parent.width
      anchors.topMargin: 0.33*parent.height
    color:"white"
    width:0.333*parent.width
    height:0.25*parent.height
    }
    Rectangle
    {id:inpRight
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.leftMargin: 0.56*parent.width
        anchors.topMargin: 0.33*parent.height
        color:"white"
        width:0.333*parent.width
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
    Rectangle{
    id:kg
    width:parent.width/20
    height:parent.width/20
    radius:parent.width
    anchors.top:parent.top
    anchors.left: parent.left
    anchors.topMargin: parent.width/2

    }
    Rectangle{}
    Rectangle{}
    Rectangle{}
    VirtualInput
    {
        anchors.fill: inpLeft
        currentText: "00"
        fontSize: 0.8*inpLeft.height
    }
    VirtualInput
    {
        anchors.fill: inpRight
        currentText: "00"
        fontSize: 0.8*inpLeft.height
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
