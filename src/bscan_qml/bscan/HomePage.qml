import QtQuick 2.7
import QtQml 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt.labs.folderlistmodel 2.12

Rectangle{

    color: "#F7F7F7"
    //    anchors.fill: parent
    id:homepage
    Component.onCompleted: {
        database.dbopen()
        var doctordata=doctor.getCurrentDoctor()
        var patientdata=patient.getCurrentPatient()

        currentdoc.text=doctordata[1]
        currentdocid.text=doctordata[0]
        currentdocemail.text=doctordata[2]
        currentpatient.text=patientdata[1]
        currentpatientid.text=patientdata[0]
        currentpatientage.text=patientdata[2]
        currentpatientgender.text=patientdata[3]
        console.log(patientdata)
    }

    Row{
        id:rowtop

        anchors.rightMargin: parent.width/10
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.top: parent.top
        anchors.topMargin: 60
        spacing: 160
        Rectangle{

            height: 300
            width: 620
            color: "#FFFFFF"
            radius: 20
            Label{
                id:type
                text: "Current Doctor"
                anchors.top: parent.top
                anchors.topMargin: 50
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 30
                font.bold: true




            }
            Label{
                id:name
                text: "Name:"
                anchors.top: type.bottom
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 20
                font.bold: true
                Label{
                    id:currentdoc
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                }
            }
            Label{
                id:docid
                text: "Doctor ID:"
                anchors.top: name.bottom

                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 20
                font.bold: true
                Label{
                    id:currentdocid
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                    text: "-"
                }

            }
            Label{
                id:email
                text: "Email:"
                anchors.top: docid.bottom
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 20
                font.bold: true
                Label{


                    id:currentdocemail
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                    text: "-"
                }

            }


        }
        Rectangle{
            height: 300
            width: 620
            color: "#FFFFFF"
            radius: 20

            Label{
                id:patientitem
                text: "Current Patient"
                anchors.top: parent.top
                anchors.topMargin: 50
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 30
                font.bold: true


            }
            Label{
                id:nameofpatient
                text: "Name:"
                anchors.top: patientitem.bottom
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 20
                font.bold: true

                Label{
                    id:currentpatient
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                    text: "-"
                }

            }
            Label{
                id:patientid
                text: "Patient ID:"
                anchors.top: nameofpatient.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 20
                font.bold: true
                Label{
                    id:currentpatientid
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                    text: "-"
                }


            }
            Label{
                id:age
                text: "Age:"
                anchors.top: patientid.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 20
                font.bold: true
                Label{
                    id:currentpatientage
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                    text: "-"
                }

            }
            Label{
                id:gender
                text: "Gender:"
                anchors.top: age.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 50
                font.pixelSize: 20
                font.bold: true
                Label{
                    id:currentpatientgender
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                    text: "-"
                }

            }
        }
    }


    Row {
        id: row
        anchors.top: rowtop.bottom
        anchors.topMargin: 60
        width: 1400
        anchors.left: rowtop.left
        //        anchors.right: rowtop.right
        height:250

        spacing: 38
        Rectangle{

            height: 250
            width: 250
            color: "#FFFFFF"
            radius: 20

            ImageButton{
                text: "B-SCAN"
                imgsource: "qrc:/homeImages/icons/B-Scan.png"

            }
            MouseArea{
                id:mouseclick
                anchors.fill: parent
                onClicked: {

                    if((mainwindown.width*0.15625===panel.width)){

                        panel.collapse=true
                        bscanbutton.visbool=false
                        console.log(bscanbutton.visbool)
                        stacked.push("qrc:/PlayVideo.qml")


                    }
                }

            }


        }
        Rectangle{
            signal clicked
            height: 250
            width: 250
            color: "#FFFFFF"
            radius: 20
            anchors.leftMargin: 10
            ImageButton{
                text: "A-SCAN"
                imgsource: "qrc:/homeImages/icons/A-Scan.png"
            }

        }
        Rectangle{

            height: 250
            width: 250
            color: "#FFFFFF"
            radius: 20
            anchors.leftMargin: 10
            ImageButton{
                text: "Calculator"
                imgsource: "qrc:/homeImages/icons/Calculator.png"
            }
        }
        Rectangle{

            height: 250
            width: 250
            color: "#FFFFFF"
            radius: 20
            anchors.leftMargin: 10
            ImageButton{
                text: "Calibrate"
                imgsource: "qrc:/homeImages/icons/Calibrate.png"
            }
        }
        Rectangle{

            height: 250
            width: 250
            color: "#FFFFFF"
            radius: 20
            anchors.leftMargin: 10
            ImageButton{
                text: "Printer"
                imgsource: "qrc:/homeImages/icons/printer.png"
            }
        }


    }



    SwipeView{
        id:recentscanscroll

        smooth: true
        interactive: true
        clip: true
        anchors.top: row.bottom
        anchors.topMargin: 80
        width: 1400
        anchors.left: row.left
        height:250



        RecentScan{
            id:listView

        }

    }

}
