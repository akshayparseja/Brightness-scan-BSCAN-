import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.VirtualKeyboard 2.1
import QtQuick.VirtualKeyboard.Settings 2.2

import QtQuick.VirtualKeyboard.Styles 2.2


import QtQuick 2.10
import QtQuick.Controls 2.3


Popup {
    id: config
    closePolicy: Popup.NoAutoClose
    modal: true
    focus: true


    property alias doctorFirstName: doctorfirstname.patientInfor
    property alias doctorLastName: doctorlastname.patientInfor
    property bool   formula: true

    property alias patientEmail: patientemail.patientInfor
    //    property alias newPrimaryFormula: new_formula_id.patientInfor
    property string selectedFormula: "SRKT"
    property alias docIdForPatient: doc_id_for_patient.patientInfor
    property alias lensOne: lensone.patientInfor
    property alias lensTwo: lenstwo.patientInfor
    property alias lensThree: lensthree.patientInfor


    Flickable {
        id: flickable
        anchors.fill: parent
        contentWidth: content.width
        contentHeight: content.height
        interactive: contentHeight > height
        flickableDirection: Flickable.VerticalFlick

        property real scrollMarginVertical: 20

        ScrollBar.vertical: ScrollBar {}

        MouseArea  {
            id: content
            width: flickable.width
            height:parent.height

            onClicked: focus = true
            Rectangle {
                radius: 20
                id: recinfor
                width: 900
                height: 650

                x: (mainwindown.width - width) / 2
                y: Math.abs(mainwindown.height - height)/5
                color: "#0ba6ff"
                //        anchors.centerIn: parent

                Text {
                    text: "Add Patients Data"
                    font.pixelSize: 32
                    anchors.left: parent.left
                    anchors.leftMargin: 100
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    color: "BLACK"
                }
                Row{
                    id: rowname
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 108
                    spacing: 30
                    PatientInfoInput{
                        id: doctorfirstname
                        title: "First name"
                        patientInfor: doctorFirstName
                    }
                    PatientInfoInput{
                        id: doctorlastname
                        title: "Last name"
                        width: 180
                        patientInfor: doctorLastName

                    }
                }
                PatientInfoInput{
                    id: patientemail
                    title: "Email"
                    width: 180
                    anchors.right: rowname.right
                    anchors.left: rowname.left
                    anchors.top: rowname.bottom
                    anchors.topMargin: 30
                    patientInfor: patientEmail
                }
                Row{
                    id: rowheight
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: patientemail.bottom
                    anchors.topMargin: 30
                    spacing: 30

                    PatientInfoInput{
                        id: doc_id_for_patient
                        title: "Doctor ID"
                        width: 265

                        Connections{
                            target: mainwindown

                            onS_config_generateID:{
                                doc_id_for_patient.patientInfor=_id
                            }
                        }




                    }

                }
                Row {
                    id: formulaitem
                    height: patientemail.height
                    width: 350
                    anchors.top: rowheight.bottom
                    anchors.topMargin: 30
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    spacing: 50

                    Text {
                        text: "Primary Formula"
                        font.pixelSize: 18
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    GenderButton{
                        id: srkt
                        anchors.verticalCenter: parent.verticalCenter
                        buttonName: "SRKT"
                        buttonStatus: formula
                        onClicked: {
                            selectedFormula=buttonName

                            buttonStatus = true

                            hofferq.buttonStatus=false
                            haigis.buttonStatus=false
                            holladay.buttonStatus=false
                            srkii.buttonStatus = false

                            formula = true //
                        }
                    }
                    GenderButton{
                        id: srkii
                        buttonName: "SKRII"
                        anchors.verticalCenter: parent.verticalCenter
                        buttonStatus: !formula
                        onClicked: {
                            selectedFormula=buttonName

                            srkt.buttonStatus = false
                            hofferq.buttonStatus=false
                            haigis.buttonStatus=false
                            holladay.buttonStatus=false
                            buttonStatus = true
                            srkt.buttonStatus = false
                            formula = false
                        }
                    }
                    GenderButton{
                        id: haigis
                        buttonName: "Haigis"
                        anchors.verticalCenter: parent.verticalCenter
                        buttonStatus: !formula
                        onClicked: {
                            selectedFormula=buttonName

                            srkt.buttonStatus = false
                            srkii.buttonStatus = false
                            hofferq.buttonStatus=false
                            holladay.buttonStatus=false

                            buttonStatus = true
                            srkt.buttonStatus = false
                            formula = false
                        }
                    }
                    GenderButton{
                        id: holladay
                        buttonName: "Holladay"
                        anchors.verticalCenter: parent.verticalCenter
                        buttonStatus: !formula
                        onClicked: {
                            selectedFormula=buttonName

                            srkt.buttonStatus = false
                            srkii.buttonStatus = false
                            hofferq.buttonStatus=false
                            haigis.buttonStatus=false

                            buttonStatus = true
                            formula = false
                        }
                    }
                    GenderButton{
                        id: hofferq
                        buttonName: "HofferQ"
                        anchors.verticalCenter: parent.verticalCenter
                        buttonStatus: !formula
                        onClicked: {
                            selectedFormula=buttonName

                            buttonStatus = true

                            srkt.buttonStatus = false
                            srkii.buttonStatus = false
                            holladay.buttonStatus=false
                            haigis.buttonStatus=false

                            formula = false
                        }
                    }
                }

                Row{
                    id: rowheight1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: formulaitem.bottom
                    anchors.topMargin: 30
                    spacing: 30
                    PatientInfoInput{
                        id: lensone
                        title: "Lens One Present"
                        width: 265
                        patientInfor: lensOne

                    }
                    PatientInfoInput{
                        id: lenstwo
                        title: "Lens Two Present"
                        width: 265
                        patientInfor: lensTwo


                    }
                    PatientInfoInput{
                        id: lensthree
                        title: "Lens Three Present"
                        width: 265
                        patientInfor: lensThree


                    }
                }
                Row{
                    id: rowbt
                    spacing: 10
                    anchors.top: rowheight1.bottom
                    anchors.topMargin: 30
                    width: rowname.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 35

                    GeneralButton{
                        radius: 100
                        width: (rowbt.width - rowbt.spacing)/3
                        text: "Close"
                        color: "#757575"
                        onClicked:{ config.close()

                        }
                    }
                    GeneralButton{
                        radius: 100
                        width: (rowbt.width - rowbt.spacing)*2/3
                        text: "Add Entry"
                        color: "#407899"
                        onClicked: {

                            var name=doctorFirstName+doctorLastName
                            database.dbopen()
                            var  ret=doctor.addDoctor(docIdForPatient,name,lensOne,lensTwo,lensThree,selectedFormula,patientEmail)
                            mypopup.out=ret
                            mypopup.open()
                            docIdForPatient=name=lensOne=lensThree=lensTwo=selectedFormula=patientEmail=doctorFirstName=doctorLastName=""
                            config.close()
                            stacked.push("DoctorData.qml")
                        }
                    }

                }



                InputPanel {
                    id:inputpanel
                    width: recinfor.width
                    visible: active
                    anchors.left: parent.left

                    anchors.top:parent.bottom

                }

            }

        }
    }
}










