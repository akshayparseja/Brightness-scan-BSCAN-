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
    property int decimals: 2
    property real realValue: 45.0
    property real realFrom: 0.0
    property real realTo: 100.0
    property real realStepSize: 0.1

    property alias patientFistName: patientfistname.patientInfor
    property alias patientLastName: patientlastname.patientInfor
    property bool   patientGender: true
    property bool   operatingModeBool: true
    property bool   operatingMethodBool: true
    property bool   operatingEyeBool: true

    property string selectedGender: "Male"
    property string selectedOperatingMethod:"Aphakic"
    property string selectedOperatingMode:"Contact"
    property string selectedOperatingEye:"Left"
//    property alias keyboardvisibility: inputpanel.active
    property alias patientAge: patientage.patientInfor

    property alias enterPhone: phone.patientInfor
    property alias patientID: new_patient_id.patientInfor
    property alias docIdPatient: doc_id_for_patient.patientInfor


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
                width: 1200
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
                Rectangle{
                    height: parent.height-100
                    width:2
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.left: rowname.right
                    anchors.leftMargin: 50
                }
                Row{
                    id: lklabels
                    anchors.top: parent.top
                    anchors.topMargin: 130
                    anchors.left: rowname.right
                    anchors.leftMargin: 60
                    spacing: 180
                    Label{
                        font.bold: true
                        text: "LK"
                        font.pixelSize: 20
                    }
                    Label{
                        font.bold: true
                        font.pixelSize: 20
                        text: "LK1"
                    }
                    Label{
                        font.bold: true
                        font.pixelSize: 20
                        text: "LK2"
                    }
                }
                Row{
                    id: lkvalues
                    anchors.top: lklabels.top
                    anchors.topMargin: 30
                    anchors.left: rowname.right
                    anchors.leftMargin: 60
                    spacing: 30

                    SpinBox{
                        property real factor: Math.pow(10, decimals)
                        id: lk
                        editable: true

                        stepSize: realStepSize*factor
                        value: realValue*factor
                        to : realTo*factor
                        from : realFrom*factor
                        validator: DoubleValidator {
                            bottom: Math.min(rk.from, rk.to)*rk.factor
                            top:  Math.max(rk.from, rk.to)*rk.factor
                        }

                        textFromValue: function(value, locale) {
                            return parseFloat(value*1.0/factor).toFixed(decimals);
                        }
                        valueFromText: function(text, locale) {
                            return Number.fromLocaleString(locale, text) * 100
                        }
                    }

                    SpinBox{
                        property real factor: Math.pow(10, decimals)
                        id: lk1
                        editable: true

                        stepSize: realStepSize*factor
                        value: realValue*factor
                        to : realTo*factor
                        from : realFrom*factor
                        validator: DoubleValidator {
                            bottom: Math.min(rk.from, rk.to)*rk.factor
                            top:  Math.max(rk.from, rk.to)*rk.factor
                        }

                        textFromValue: function(value, locale) {
                            return parseFloat(value*1.0/factor).toFixed(decimals);
                        }
                        valueFromText: function(text, locale) {
                            return Number.fromLocaleString(locale, text) * 100
                        }
                    }

                    SpinBox{
                        property real factor: Math.pow(10, decimals)
                        id: lk2
                        editable: true

                        stepSize: realStepSize*factor
                        value: realValue*factor
                        to : realTo*factor
                        from : realFrom*factor
                        validator: DoubleValidator {
                            bottom: Math.min(rk.from, rk.to)*rk.factor
                            top:  Math.max(rk.from, rk.to)*rk.factor
                        }

                        textFromValue: function(value, locale) {
                            return parseFloat(value*1.0/factor).toFixed(decimals);
                        }
                        valueFromText: function(text, locale) {
                            return Number.fromLocaleString(locale, text) * 100
                        }
                    }
                }
                Row{
                    id: rklabels
                    anchors.top: lkvalues.top
                    anchors.topMargin: 95
                    anchors.left: rowname.right
                    anchors.leftMargin: 60
                    spacing: 180
                    Label{
                        font.bold: true
                        text: "RK"
                        font.pixelSize: 20
                    }
                    Label{
                        font.bold: true
                        font.pixelSize: 20
                        text: "RK1"
                    }
                    Label{
                        font.bold: true
                        font.pixelSize: 20
                        text: "RK2"
                    }
                }
                Row{
                    id: rkvalues
                    anchors.top: lkvalues.top
                    anchors.topMargin: 122
                    anchors.left: rowname.right
                    anchors.leftMargin: 60
                    spacing: 30


                    SpinBox{
                        property real factor: Math.pow(10, decimals)
                        id: rk
                        editable: true

                        stepSize: realStepSize*factor
                        value: realValue*factor
                        to : realTo*factor
                        from : realFrom*factor
                        validator: DoubleValidator {
                            bottom: Math.min(rk.from, rk.to)*rk.factor
                            top:  Math.max(rk.from, rk.to)*rk.factor
                        }

                        textFromValue: function(value, locale) {
                            return parseFloat(value*1.0/factor).toFixed(decimals);
                        }
                        valueFromText: function(text, locale) {
                            return Number.fromLocaleString(locale, text) * 100
                        }
                    }
                    SpinBox{
                        property real factor: Math.pow(10, decimals)
                        id: rk1
                        editable: true

                        stepSize: realStepSize*factor
                        value: realValue*factor
                        to : realTo*factor
                        from : realFrom*factor
                        validator: DoubleValidator {
                            bottom: Math.min(rk1.from, rk1.to)*rk1.factor
                            top:  Math.max(rk1.from, rk1.to)*rk1.factor
                        }

                        textFromValue: function(value, locale) {
                            return parseFloat(value*1.0/factor).toFixed(decimals);
                        }
                        valueFromText: function(text, locale) {
                            return Number.fromLocaleString(locale, text) * 100
                        }
                    }
                    SpinBox{
                        property real factor: Math.pow(10, decimals)
                        id: rk2
                        editable: true

                        stepSize: realStepSize*factor
                        value: realValue*factor
                        to : realTo*factor
                        from : realFrom*factor
                        validator: DoubleValidator {
                            bottom: Math.min(rk2.from, rk2.to)*rk2.factor
                            top:  Math.max(rk2.from, rk2.to)*rk2.factor
                        }

                        textFromValue: function(value, locale) {
                            return parseFloat(value*1.0/factor).toFixed(decimals);
                        }
                        valueFromText: function(text, locale) {
                            return Number.fromLocaleString(locale, text) * 100
                        }
                    }
                }

                Row{
                    id: rowname
                    anchors.left: parent.left
                    anchors.leftMargin: 80
                    anchors.top: parent.top
                    anchors.topMargin: 80
                    spacing: 30

                    PatientInfoInput{

                        id: patientfistname
                        title: "First name"
                        patientInfor: patientFistName

                        onPatientFocusChanged: {
                            if(patientFocus) recinfor.y = +50
                        }
                    }

                    PatientInfoInput{
                        id: patientlastname
                        title: "Last name"
                        width: 180
                        patientInfor: patientLastName
                        onPatientFocusChanged: {
//                            inputpanel.active=true
                            if(patientFocus) recinfor.y = +50
                        }
                    }
                }
                Row{
                    id: rowheight
                    anchors.left: rowname.left

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rowname.bottom
                    anchors.topMargin: 15
                    spacing: 30
                    PatientInfoInput{
                        id: new_patient_id
                        title: "Patient ID"
                        width: 265
                        Connections{
                            target: mainwindown

                            onS_config_generatePatientID:{
                                new_patient_id.patientInfor=_id
                            }
                        }


                    }
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
                    id: genderitem
                    height: patientage.height
                    width: 350
                    anchors.top: rowheight1.bottom
                    anchors.topMargin: 15
                    anchors.left: rowname.left
                    spacing: 50

                    Text {
                        text: "Gender"

                        font.pixelSize: 18
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter


                        GenderButton{
                            id: malebt
                            anchors.left: parent.right
                            anchors.leftMargin: 140
                            anchors.verticalCenter: parent.verticalCenter
                            buttonName: "Male"
                            buttonStatus: patientGender
                            onClicked: {
                                selectedGender=buttonName
                                buttonStatus = true
                                femalebt.buttonStatus = false
                                patientGender = true // true: male

                            }
                        }
                        GenderButton{
                            id: femalebt
                            anchors.left: parent.right
                            anchors.leftMargin: 290
                            buttonName: "Female"
                            anchors.verticalCenter: parent.verticalCenter
                            buttonStatus: !patientGender
                            onClicked: {
                                selectedGender=buttonName
                                buttonStatus = true
                                malebt.buttonStatus = false
                                patientGender = false // false : female
                            }
                        }
                    }
                }
                Row{
                    id: rowheight1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rowheight.bottom
                    anchors.topMargin: 15
                    anchors.left: rowname.left
                    spacing: 30
                    PatientInfoInput{
                        id: phone
                        title: "Phone"
                        width: 265
                        patientInfor:enterPhone
                        inputMethodHints: Qt.ImhDialableCharactersOnly

                    }
                    PatientInfoInput{
                        id: patientage
                        title: "Age"
                        width: 180
                      inputMethodHints: Qt.ImhDialableCharactersOnly
                        anchors.topMargin: 15
                        patientInfor: patientAge


                    }
                }

                Row {
                    id: operatingMethod
                    height: patientage.height
                    width: 350
                    anchors.top: genderitem.bottom
                    anchors.topMargin: 15
                    anchors.left: rowname.left
                    spacing: 50

                    Text {
                        text: "Operating Method"
                        font.pixelSize: 18
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter


                        GenderButton{
                            anchors.left: parent.right
                            anchors.leftMargin: 50
                            id: aphakic
                            anchors.verticalCenter: parent.verticalCenter
                            buttonName: "Aphakic"
                            buttonStatus: operatingMethodBool
                            onClicked: {
                                selectedOperatingMethod=buttonName
                                buttonStatus = true
                                phakic.buttonStatus = false
                                operatingMethodBool = true // true: male

                            }
                        }
                        GenderButton{
                            id: phakic
                            anchors.left: parent.right
                            anchors.leftMargin: 200
                            buttonName: "Phakic"
                            anchors.verticalCenter: parent.verticalCenter
                            buttonStatus: !operatingMethodBool
                            onClicked: {
                                selectedOperatingMethod=buttonName
                                buttonStatus = true
                                aphakic.buttonStatus = false
                                operatingMethodBool = false // false : female
                            }
                        }
                    }
                }
                Row {
                    id: operatingMode
                    height: patientage.height
                    width: 350
                    anchors.top: operatingMethod.bottom
                    anchors.topMargin: 5
                    anchors.left: rowname.left
                    spacing: 55

                    Text {
                        text: "Operating Mode   "
                        font.pixelSize: 18
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter


                        GenderButton{
                            id: contact
                            anchors.left: parent.right
                            anchors.leftMargin: 58
                            anchors.verticalCenter: parent.verticalCenter
                            buttonName: "Contact"
                            buttonStatus: operatingModeBool
                            onClicked: {
                                selectedOperatingMode=buttonName
                                buttonStatus = true
                                immersion.buttonStatus = false
                                operatingModeBool = true // true: male

                            }
                        }
                        GenderButton{
                            id: immersion
                            anchors.left: parent.right
                            anchors.leftMargin: 207
                            buttonName: "Immersion"
                            anchors.verticalCenter: parent.verticalCenter
                            buttonStatus: !operatingModeBool
                            onClicked: {
                                selectedOperatingMode=buttonName
                                buttonStatus = true
                                contact.buttonStatus = false
                                operatingModeBool = false // false : female
                            }
                        }
                    }
                }
                Row {
                    id: operatingEye
                    height: patientage.height
                    width: 350
                    anchors.top: operatingMode.bottom
                    anchors.topMargin: 5
                    anchors.left: rowname.left
                    spacing: 62

                    Text {
                        text: "Operating Eye     "
                        font.pixelSize: 18
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter


                        GenderButton{
                            id: leftone
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.right
                            anchors.leftMargin: 70
                            buttonName: "Left"
                            buttonStatus: operatingEyeBool
                            onClicked: {
                                selectedOperatingEye=buttonName
                                buttonStatus = true
                                rightone.buttonStatus = false
                                operatingEyeBool = true // true: male

                            }
                        }
                        GenderButton{
                            id: rightone
                            buttonName: "Right"
                            anchors.left: parent.right
                            anchors.leftMargin: 218
                            anchors.verticalCenter: parent.verticalCenter
                            buttonStatus: !operatingEyeBool
                            onClicked: {
                                selectedOperatingEye=buttonName
                                buttonStatus = true
                                leftone.buttonStatus = false
                                operatingEyeBool = false // false : female
                            }
                        }
                    }
                }

                Row{
                    id: rowbt
                    spacing: 10

                    width: rowname.width
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.horizontalCenter: parent.horizontalCenter


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

                            var name=patientFistName+patientLastName
                            database.dbopen()
                            var  ret=patient.addPatient(patientID,name,selectedGender,patientAge,enterPhone,docIdPatient,lk1.value/100,lk2.value/100,lk.value/100,rk1.value/100,rk2.value/100,rk.value/100,selectedOperatingMode,selectedOperatingEye,selectedOperatingMethod)
                            mypopup.out=ret
                            mypopup.open()
                            patientAge=patientFistName=selectedGender=patientLastName=patientID=docIdPatient=""
                            config.close()
                            stacked.push("PatientData.qml")
                        }
                    }

                }
                InputPanel {
                    id:inputpanel
//                    y:parent.height
                    width: recinfor.width-200
                    visible: active
                    anchors.left: parent.left
                    anchors.leftMargin: 100
                    anchors.top:parent.bottom

                }

            }

        }
    }



}






