import QtQuick 2.0
import QtGraphicalEffects 1.0

import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import Qt.labs.folderlistmodel 2.12

Rectangle {
    id: rectangle2
    width: 0.15625*parent.width
    height: parent.height

    property alias collapse: heightAnimation.running
    property color iconBgColorLeft: "#407899"
    property color iconBgColorRight: "#407899"


    SplitView {

        anchors.fill: parent



        Rectangle {
            z: 1
            height: 10
            id: rect1
            Layout.fillWidth: true

            Rectangle {
                anchors.fill: parent

                color: "#407899"
            }

            Item {
                id:timedate
                visible: bscanbutton.currentlist
                anchors.top: parent.top

                anchors.leftMargin:20
                anchors.topMargin: 50
                anchors.left: parent.left
                Timer {
                    interval: 500; running: true; repeat: true
                    onTriggered: {

                        date.text =new Date().toLocaleDateString(Qt.locale("En"))
                        time.text= new Date().toLocaleTimeString(Qt.locale("En"))


                    }
                }

                Label {
                    id:date
                    font.pixelSize: 14
                    color: "#FFFFFF"
                    text: new Date().toLocaleDateString(Qt.locale("En"))
                }
                Label {
                    id:time
                    font.pixelSize: 25
                    color: "#FFFFFF"
                    anchors.top: date.bottom
                    anchors.topMargin: 10
                    text: new Date().toLocaleTimeString(Qt.locale("En"))
                }
            }
            BscanButtons{
                id:bscanbutton
                y:rectangle2.height/3



            }


            Item {
                id:company
                visible: bscanbutton.currentlist
                anchors.bottom: parent.bottom
                height: 30
                width: 30
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.bottomMargin: 40
                Image {
                    height: 50

                    width: 100
                    id: visualImage
                    anchors.bottom: buttontext.top
                    source: "qrc:/images/icons/greenmed.png"
                }

                Text {
                    id: buttontext
                    color: "#FFFFFF"
                    font.bold: true
                    text: "Greenmed<br>Technologies"
                }
            }

        }
        //        PropertyAnimation {

        //            id: heightAnimation1
        //            target: rectangle2
        //            property: "width";
        //            from: rect1.width;
        //            to: rect1.width*0.33;

        //            duration: 480

        //            loops: 1;
        //            onStarted:  {
        //                if(rectangle2.width===mainwindown.width*0.15625)
        //                {

        //                    timedate.visible=false
        //                    company.visible=false

        //                }
        //                else{

        //                    timedate.visible=true
        //                    company.visible=true

        //                }
        //            }

        //        }

        PropertyAnimation {

            id: heightAnimation
            target: rectangle2
            property: "width";
            from: rect1.width;
            to: rect1.width*0.33;

            duration: 480

            loops: 1;
            onStarted:  {
                if(rectangle2.width===mainwindown.width*0.15625)
                {

                    timedate.visible=false
                    company.visible=false

                }
                else{

                    timedate.visible=true
                    company.visible=true

                }
            }

        }
        PropertyAnimation {

            id: widthAnimation
            target: rectangle2
            property: "width";

            from: rect1.width;
            to: mainwindown.width*0.15625
            duration: 480

            loops: 1;
            onRunningChanged: if(rectangle2.width===mainwindown.width*0.15625){
                                  bscanbutton.currentlist=true
                              }
                              else{
                                  bscanbutton.currentlist=false
                              }

        }
        PropertyAnimation {

            id: widthAnimation1
            target: rectangle2
            property: "width";

            from: rect1.width;
            to: mainwindown.width*0.15625
            duration: 480

            loops: 1;
            onStarted: {
                company.visible=true
                timedate.visible=true}

        }




    }

}


