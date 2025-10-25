import QtQuick 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import Qt.labs.folderlistmodel 2.12


Column
{



    spacing: 0
    height: parent.height
    id:columnlayout


    property alias currentlist:currentview.visible
    property bool visbool: true
    onVisboolChanged: currentview.model=model1
    ListView {
        spacing :10
        id:currentview
        visible: visbool
        anchors.fill: parent
        model: visbool?model:model1
        delegate: delegate

        highlight:
            Rectangle {
            id: rooot
            x:40
            width: 260; height: 50
            color: ListView.isCurrentItem ? "black" : "#F7F7F7"; radius: 25

            y: currentview.currentItem.y-10
            Behavior on y {
                SpringAnimation {
                    spring: 0.5
                    damping: 0.15
                }
            }

        }
        highlightFollowsCurrentItem: true



    }
    ListView {
        spacing :10
        id:currentview1
        visible: !currentlist
        anchors.fill: parent
        model: model1
        delegate: delegate

        highlight:
            Rectangle {
            id: rooot1
            x:40
            width: 260; height: 50
            color: ListView.isCurrentItem ? "black" : "#F7F7F7"; radius: 25

            y: currentview.currentItem.y-10
            Behavior on y {
                SpringAnimation {
                    spring: 0.5
                    damping: 0.15
                }
            }

        }
        highlightFollowsCurrentItem: true



    }
    Component {
                id: delegate

                Column {

                    Item {

                        id: categoryItem
                        height: 50
                        anchors.left: parent.left
                        width: rectangle2.width



                        property bool collapse: false
                        property alias text: buttontext.text
                        signal clicked

                        Image {
                            id: visualImage
                            width: 25
                            height: 30

                            anchors.left: parent.left
                            anchors.leftMargin:  60
                            source: sourceImg

                        }
                        ColorOverlay{
                            id:colorover
                            anchors.fill: visualImage
                            source:visualImage
                            color: currentview.currentIndex===index?"#407899":"#FFFFFF"
                            antialiasing: true

                        }


                        Text {
                            id:buttontext
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.top: parent.top
                            anchors.topMargin:5
                            anchors.left: visualImage.right
                            anchors.leftMargin: 13
                            anchors.right: parent.right
                            font.pixelSize: 20
                            text: categoryName
                            color: currentview.currentIndex===index?"#407899":"#FFFFFF"

    //                        color: buttontext.ListView.isCurrentItem ? "red" : skin.gray

                        }
                        MouseArea{
                            anchors.fill: parent


                            onClicked:{


                                currentview.currentIndex = index

                                if((mainwindown.width*0.+15625==rectangle2.width)){
                                    console.log("hi")
                                    collapse=true
                                }
                                if(buttontext.text=="Home"){


                                    stacked.push("HomePage.qml")
                                    widthAnimation1.running=true


                                }


                                if(buttontext.text=="Patients"){
                                    stacked.push("PatientData.qml")
                                    if(mainwindown.width*0.15625===rectangle2.width){
                                        heightAnimation.running=true
                                    }
                                }
                                else if(buttontext.text=="Doctors"){
                                    stacked.push("DoctorData.qml")
                                    if(mainwindown.width*0.15625===rectangle2.width){
                                        heightAnimation.running=true
                                    }

                                }

                            }

                        }


                    }
                }

            }
    ListModel {

        id: model1
        ListElement {

            categoryName: "Home"
            sourceImg: "qrc:/images/icons/home.png"

        }
        ListElement {

            categoryName: "Patients"
            sourceImg:"qrc:/images/icons/Patient.png"
        }

        ListElement {
            categoryName: "Doctors"
            sourceImg:"qrc:/images/icons/Doctor.png"

        }

    }

    ListModel {

        id: model
        ListElement {

            categoryName: "Home"
            sourceImg: "qrc:/images/icons/home.png"

        }
        ListElement {

            categoryName: "Patients"
            sourceImg:"qrc:/images/icons/Patient.png"
        }

        ListElement {
            categoryName: "Doctors"
            sourceImg:"qrc:/images/icons/Doctor.png"

        }

        ListElement {
            categoryName: "Lenses"
            sourceImg:"qrc:/images/icons/Lenses.png"
        }
        ListElement {
            categoryName: "Scan"
            sourceImg:"qrc:/images/icons/Scans.png"
        }

        ListElement {

            categoryName: "Setting"
            sourceImg:"qrc:/images/icons/Settings.png"
        }
    }



}


