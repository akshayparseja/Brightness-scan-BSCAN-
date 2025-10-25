import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

import QtQuick.Layouts 1.1
import QtMultimedia 5.4
import Qt.labs.folderlistmodel 2.12
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: mainWindow
    visible: true
    color: "#F7F7F7"
    Component.onCompleted: {
        var open=   database.dbopen()
        var patientnames=patient.getAllPatientName()
        var patientids=patient.getAllPatients()
        var gender = patient.getAllGender()
        console.log(gender)


        currentpatientid.text= patientids[patientids.length-1]
        currentpatientname.text=patientnames[patientids.length-1]
        currentpatientgender.text=gender[patientids.length-1]

    }
    objectName: "mainrect"


    Rectangle{
        width: 500
        height: 733.33
        anchors.right: rect.left
        anchors.rightMargin: 108
        anchors.top: parent.top
        anchors.topMargin: 101
        radius: 10
        border.color: "black"
        border.width: 1
        id:datalist
        Rectangle{
            width: 500
            height: 250
            radius: 10
            id:patientcard


            color: "#407899"



            Item {
                id: button
                width: 500
                height: 100
                signal clicked

                Label{
                    id:name
                    text: "Name:"
                    anchors.top: parent.top


                    anchors.topMargin: 40
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 20
                    font.bold: true
                    color: "#FFFFFF"
                    Label{
                        color: "#FFFFFF"
                        id:currentpatientname
                        font.pixelSize: 17
                        anchors.top: parent.top
                        anchors.topMargin: 3
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }
                }

                Label{
                    id:patientid
                    text: "Patient ID:"
                    anchors.top: name.bottom
                    color: "#FFFFFF"
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 20
                    font.bold: true
                    Label{

                        color: "#FFFFFF"
                        id:currentpatientid
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }

                }
                Label{
                    id:age
                    text: "Age:"
                    anchors.top: patientid.bottom


                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 20
                    font.bold: true
                    color: "#FFFFFF"
                    Label{
                        color: "#FFFFFF"
                        id:currentpatientage
                        font.pixelSize: 17
                        anchors.top: parent.top
                        anchors.topMargin: 3
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }
                }
                Label{
                    id:gender
                    text: "Gender:"
                    anchors.top:age.bottom


                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 20
                    font.bold: true
                    color: "#FFFFFF"
                    Label{
                        color: "#FFFFFF"

                        id:currentpatientgender
                        font.pixelSize: 17
                        anchors.top: parent.top
                        anchors.topMargin: 3
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }
                }
                Label{
                    id:type
                    text: "Type:"
                    anchors.top: gender.bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 20
                    font.bold: true
                    color: "#FFFFFF"
                    Label{
                        color: "#FFFFFF"
                        id:currenttype
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }

                }

                MouseArea{


                    anchors.fill: parent
                    onClicked:
                    {


                    }
                }
            }
        }

        ScrollView{
            smooth: true
            clip: true
            id:scrollviewofdata

            anchors.top: patientcard.bottom
            anchors.topMargin: -10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            anchors.right: parent.right
            anchors.left: parent.left

            ListView {
                anchors.fill: parent
                orientation: ListView.Vertical
                //                spacing:1
                FolderListModel {
                    id: folderModel
                    showDirs: true
                    showDirsFirst: true
                    folder:"file:///home/username/chooseurmed_B_SCAN/bscan_v2/src/bscan_qml/bscan/videos/"
                    nameFilters: ["*.*"]

                }


                Component {
                    id: fileDelegate

                    Rectangle {
                        border.color: "#407899"
                        id: button
                        width: 500
                        height: 100
                        property alias texter: buttontext.text
                        signal clicked
                        Text {
                            id: buttontext
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            font.bold: true
                            text: fileName
                            anchors.bottomMargin: 20
                        }
                        MouseArea{


                            anchors.fill: parent
                            onClicked:
                            {
                                rect.filename=texter

                                mediaplayer.source= folderModel.folder+texter


                            }
                        }
                    }


                }

                model: folderModel
                delegate: fileDelegate
            }

        }


    }
    Row{
        width: 500
        height: 80
        id:rowbuttons
        anchors.bottom: videoplaybuttons.top
        anchors.left: datalist.left
        anchors.bottomMargin: 20
        property bool buttonStatus: false

        Rectangle{
            width: 80
            height: 80

            radius: width/2
            signal clicked()
            color: rowbuttons.buttonStatus?"#407899":"#FFFFFF"
            Label{
                id:od
                anchors.centerIn: parent
                text: "OD"
                font.bold:true
                font.pixelSize: 18
                color: !rowbuttons.buttonStatus?"#407899":"#FFFFFF"

            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(rowbuttons.buttonStatus==false){
                        rowbuttons.buttonStatus=true
                    }
                    else{
                        rowbuttons.buttonStatus=false
                    }
                }
            }


        }
    }
    Row{
        width: 500
        height: 70
        id:videoplaybuttons
        anchors.bottom: scaleimg.bottom
        anchors.left: datalist.left
        property bool buttonStatus: false
        property int recordcount: 0
        property int recordcount1: 0


        Rectangle{
            width: parent.width/2
            height: parent.height
            radius: 10
            signal clicked()
            color: videoplaybuttons.buttonStatus?"#407899":"#FFFFFF"

            Label{
                id:record
                anchors.centerIn: parent
                text: "RECORD NOW"
                font.bold:true
                font.pixelSize: 18
                color: !videoplaybuttons.buttonStatus?"#407899":"#FFFFFF"

            }
            MouseArea{
                anchors.fill: parent

                onClicked: {
                    video.visible=false
                    videoplaybuttons.buttonStatus=true



                }
            }


        }

        Rectangle{
            width: parent.width/2
            height: parent.height
            radius: 10
            signal clicked()
            color: !videoplaybuttons.buttonStatus?"#407899":"#FFFFFF"
            Label{
                anchors.centerIn: parent
                text: "PREVIOUS SCAN"
                font.bold:true
                font.pixelSize: 18
                color: videoplaybuttons.buttonStatus?"#407899":"#FFFFFF"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    video.visible=true
                    videoplaybuttons.buttonStatus=false
                }
            }
        }
    }

    Rectangle {
        color: "black"
        width:1024
        height: 950
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        radius: 10
        id:rect
        property int type: -1
        property int count: 0
        property double distance: 0
        property string filename: ""
        property bool isRunning: true


        Rectangle{
            color: "red"
            width: 20
            focus: true
            height: 20
            radius: width/2
            anchors.top: rect.top
            anchors.right: rect.right
            anchors.topMargin: 25
            anchors.rightMargin: 25
        }

        Item {
            //            anchors.top:
            anchors.fill: parent
            id:itemm
            anchors.bottom: rect.bottom

            Rectangle {
                anchors.fill: parent
                visible: !video.visible
                Image {
                    id: image
                    mirror: true
                    //                    rotation: 180
                    anchors.fill: parent
                    source: "image://videoCapture/hoge"
                }
                Timer {
                    property int cnt: 0
                    interval: 1

                    running: true
                    repeat: true
                    onTriggered:  {
                        if (image.status === Image.Ready) {
                            image.source = "image://videoCapture/" + cnt;
                            ++cnt;
                        }
                    }
                }
            }
            VideoOutput {


                anchors.fill: parent
                source:mediaplayer
                fillMode: VideoOutput.PreserveAspectCrop

                id:video
                //                visible: true
                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        playpausevis.running=true
                    }
                }
                SequentialAnimation {
                    id:playpausevis
                    running: false
                    PauseAnimation {
                        duration: 500 // Wait for 4000ms
                    }

                    NumberAnimation {
                        target: playpause
                        property: 'opacity'
                        to: 1
                        duration: 5000 // Then fade away for 1000ms
                    }
                    NumberAnimation {
                        target: playpause
                        property: 'opacity'
                        to: 0
                        duration: 1000 // Then fade away for 1000ms
                    }
                }
                MediaPlayer {
                    id: mediaplayer
                    //                    source:camera
                    autoPlay: true
                    /* playbackState:
                      0 - stopped
                      1 - playing
                      2 - paused
                    */
                    onPositionChanged: {
                        //                        progressbarSlider.value = mediaplayer.position/mediaplayer.duration
                        //  Converting miliseconds to minutes and seconds.
                        var currentTime = mediaplayer.position
                        var currentMin = Math.floor(currentTime/1000/60)
                        var currentSec = (currentTime/1000) % 60
                        currentSec = currentSec.toFixed(0)

                        var totalTime =mediaplayer.duration
                        var totalMin =Math.floor(totalTime/1000/60)
                        var totalSec = (totalTime/1000) % 60
                        totalSec = totalSec.toFixed(0)


                    }
                    onPlaybackStateChanged: {
                        if(mediaplayer.playbackState === 0 || mediaplayer.playbackState === 2) {
                            playPauseButton.source="qrc:/images/icons/play.png"
                        }
                        else {
                            playPauseButton.source="qrc:/images/icons/pause.png"

                        }
                    }
                }

            }
        }
    }



    Row {
        id:playpause
        //        visible: false
        opacity: 0
        width: 510
        height: 100
        spacing: 145
        anchors.centerIn: rect
        Item {
            width: 50
            height: 50
            Image {
                focus: true
                anchors.fill: parent
                signal clicked()
                source:  "qrc:/images/backward.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        mediaplayer.seek(mediaplayer.position - 1000)
                    }
                }

            }
        }
        Item {
            width: 50
            height: 50
            ColorOverlay{
                id:colorover
                anchors.fill: playPauseButton
                source:playPauseButton
                color: "#FFFFFF"
                antialiasing: true

            }
            Image {
                id:playPauseButton
                focus: true
                anchors.fill: parent
                signal clicked()
                source: "qrc:/images/icons/play.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(mediaplayer.playbackState === 0 || mediaplayer.playbackState === 2) {
                            mediaplayer.play()
                        }
                        else  {
                            mediaplayer.pause()

                        }
                    }
                }


            }


        }

        Item {
            width: 50
            height: 50
            Image {
                focus: true
                anchors.fill: parent
                signal clicked()
                source:  "qrc:/images/forward.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        mediaplayer.seek(mediaplayer.position + 1000)
                    }
                }

            }
        }


    }



    Image {
        anchors.bottom: rect.bottom
        anchors.left: rect.left
        anchors.right: rect.right
        width: 1024
        height: 55
        id: scaleimg
        source: "qrc:/images/scale.png"
    }

    //    ColumnLayout{
    //        anchors.left:rowlay.right
    //        anchors.right: parent.right
    //        y:mainWindow.height/2
    //        Button{
    //            focus: true
    //            text: "PLAY"
    //            onClicked:mediaplayer.play()

    //        }
    //        Button{
    //            focus: true
    //            text: "PAUSE"
    //            onClicked:mediaplayer.pause()
    //        }
    //        Button{
    //            focus: true
    //            text: "SnapShot"
    //            onClicked:video.grabToImage(function(result) { result.saveToFile("/home/username/QT PRACTICE/B_scan/bscan_v2/src/bscan_qml/bscan/images/"+rect.filename+".png") });

    //        }
    //        Button{
    //            visible: true
    //            focus: true
    //            text: "annotation"
    //            onClicked: {
    //                //                var component = Qt.createComponent("Annotations.qml");
    //                //                      win = component.createObject(mainwindown);
    //                //                      win.show();
    //                stacked.push("Annotations.qml")
    //                //                    preusecheck.close()

    //            }

    //        }

    //    }
}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
