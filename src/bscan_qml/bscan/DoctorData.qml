import QtQuick 2.0
import Qt.labs.folderlistmodel 2.12
import QtQuick.Controls 2.5
Rectangle{
    color: "#F7F7F7"

    TextField{
        width: 300
        height: 40
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.topMargin: 85
        background:     Rectangle{

            color: "#FFFFFF"
            radius: 10
        }
        id:searchtext
        font.pixelSize: 25
        placeholderText: "Search Doctor ID"
        onAccepted: {
            var check=doctor.checkDoctorID(searchtext.text)
            if(check===true){
                var searchdata=doctor.getDoctorID(searchtext.text)
                listModel1.clear()
                listModel1.append({doc_id:searchdata[0],
                                      doc_name:searchdata[1],
                                      doc_formula:searchdata[2]});
                flowrepeat.model=listModel1
            }
            else{

                flowrepeat.model=listModel
                mypopup.out="NO SUCH ENTRY FOUND"
                mypopup.open()
            }
        }

    }
//    Item {
//        id:timedate
//        anchors.top: parent.top
//        anchors.topMargin: 20
//        anchors.bottom: searchtext.top
//        anchors.left: searchtext.left
//        Timer {
//            interval: 500; running: true; repeat: true
//            onTriggered: {

//                date.text =new Date().toLocaleDateString(Qt.locale("En"))
//                time.text= new Date().toLocaleTimeString(Qt.locale("En"))


//            }
//        }
//        Label {
//            id:date
//            font.pixelSize: 14
//            color: "black"
//            text: new Date().toLocaleDateString(Qt.locale("En"))
//        }
//        Label {
//            id:time
//            font.pixelSize: 25
//            color: "black"
//            anchors.top: date.bottom
//            anchors.topMargin: 10
//            text: new Date().toLocaleTimeString(Qt.locale("En"))
//        }
//    }
    Item{
        signal clicked
        visible: true

        height: 50
        width: 50
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 85
        anchors.rightMargin: 100
        id: menu
        focus: true
        Image {
            anchors.fill: parent
            id: adddata
            source: "qrc:/images/icons/add.png"
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                database.dbopen()
                var doctorid=doctor.generateID()
                s_config_generateID(doctorid)

                add_doctor.open()
            }

        }
    }
    Rectangle{
        width: parent.width
        height: 0.8*parent.height
        anchors.top: parent.top
        anchors.topMargin: 150

        Label{
            id:labelscan
            width: 156
            height: 29
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.topMargin: 20
            font.pixelSize: 25
            font.bold: true

            text:"RECENT SCANS"
        }
    }
    Flickable {

        id:listView
        clip: true
        anchors.topMargin: 150
        anchors.leftMargin: 100
        anchors.rightMargin: 100
        anchors.fill: parent
        contentWidth: flow.implicitWidth
        contentHeight: height

        ListModel {
            id: listModel

            Component.onCompleted: {
                database.dbopen()
                var doctorids=doctor.getAllDoctorId()
                var doctordata1=doctor.getAllDoctorsName()
                var formula=doctor.getAllDoctorPrimaryFormula()
                for (var i = 0; i < doctordata1.length; i++) {

                    append({doc_id:doctorids[i],
                               doc_name:doctordata1[i],
                               doc_formula:formula[i]});
                }
            }


        }
        ListModel {
            id: listModel1




        }
        Component {
            id: fileDelegate
            Rectangle{
                width: 1920*0.165
                height: 1080*0.2*0.8
                color: "#407899"
                radius: 20
                Item{
                    signal clicked
                    visible: true
                    anchors.top: parent.top
                    anchors.right: parent.right
                    height: 30
                    width: 40
                    anchors.topMargin: 10
                    anchors.rightMargin: 10
                    id: menu
                    focus: true

                    Menu {

                        id: menutype
                        y: menu.height
                        width: 65

                        background:Rectangle{
                            //                                color: "#407899"
                            radius: 20

                        }

                        MenuItem {
                            Label{
                                anchors.centerIn: parent
                                text: "Edit"
                                //                                    color: "white"
                            }

                        }
                        MenuItem {
                            Label{
                                anchors.centerIn: parent
                                text: "Delete"

                                //                                    color: "white"
                            }
                            onClicked: {

                                var ret=doctor.deleteDoctor(currentdocid.text)
                                mypopup.out=ret
                                mypopup.open()
                                stacked.push("DoctorData.qml")
                            }
                        }
                        MenuItem {
                            Label{
                                anchors.centerIn: parent
                                text: "Open"
                                //                                    color: "white"
                            }
                        }
                        MenuItem {
                            Label{
                                anchors.centerIn: parent
                                text: "Set"
                                //                                    color: "white"
                            }
                        }
                    }
                    Image
                    {
                        source: "qrc:/images/icons/menu_dots.png"
                    }
                    MouseArea{

                        anchors.fill: parent
                        onClicked:{

                            menutype.open()
                        }
                    }
                }
                Item {
                    id: button
                    width: 1920*0.12
                    height: 1080*0.2*0.8
                    //                        property alias valuedata: scanidvalue.text


                    signal clicked

                    Label{
                        id:name
                        text: "Doctor Name:"
                        anchors.top: parent.top


                        anchors.topMargin: 40
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        font.pixelSize: 20
                        font.bold: true
                        color: "#FFFFFF"
                        Label{
                            color: "#FFFFFF"
                            text:doc_name
                            id:currentdoc
                            font.pixelSize: 17
                            anchors.top: parent.top
                            anchors.topMargin: 3
                            anchors.left: parent.right
                            anchors.leftMargin: 10

                        }
                    }
                    Label{
                        id:docid
                        text: "Doctor ID:"
                        anchors.top: name.bottom
                        color: "#FFFFFF"
                        anchors.topMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        font.pixelSize: 15
                        font.bold: true
                        Label{

                            color: "#FFFFFF"
                            text:doc_id
                            id:currentdocid
                            anchors.left: parent.right
                            anchors.leftMargin: 10

                        }

                    }
                    Label{
                        id:email
                        text: "Primary Formula:"
                        anchors.top: docid.bottom
                        anchors.topMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        font.pixelSize: 15
                        font.bold: true
                        color: "#FFFFFF"
                        Label{
                            color: "#FFFFFF"
                            text: doc_formula
                            id:currentdocemail
                            anchors.left: parent.right
                            anchors.leftMargin: 10

                        }

                    }   MouseArea{


                        anchors.fill: parent
                        onClicked:
                        {


                        }
                    }
                }
            }


        }


        Flow {
            clip: true
            id: flow
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.left: parent.left
            anchors.leftMargin: 50
            flow: Flow.TopToBottom
            layoutDirection: "LeftToRight"
            height:  parent.height
            spacing: 30
            Repeater {
                id:flowrepeat
                model:listModel

                delegate: fileDelegate
            }
        }


    }
    Rectangle {
        id: upButton
        anchors.left: parent.left
        anchors.leftMargin: 50
        height: 40
        width: 40
        y:parent.height/2-height/2
        Image {
            id: rightleft
            rotation: 180


            height: 40
            width: 40
            signal clicked
            source: "qrc:/images/icons/Right_Next Icon.png"
        }
        MouseArea {
            anchors.fill: parent
            id: listUp

            SmoothedAnimation {
                target: listView
                property: "contentX"
                running: listUp.pressed
                velocity: 2500
                to: 0
            }
            onClicked:  {
                if (!listView.atXBeginning)
                    listView.flick(0, 1000)
            }
        }
    }


    // Down Button to move list down
    Rectangle {
        id: downButton
        height: upButton.height
        width: upButton.width
        radius: upButton.radius
        color: upButton.color
        anchors.right: parent.right
        anchors.rightMargin: 50
        y: parent.height/2-height/2


        Image {
            id: leftright

            y:parent.height/2-height/2
            height: 40
            width: 40
            anchors.rightMargin: 10
            signal clicked
            source: "qrc:/images/icons/Right_Next Icon.png"
        }

        MouseArea {
            anchors.fill: parent
            id: listDown

            SmoothedAnimation {
                target: listView
                property: "contentX"
                running: listDown.pressed
                to: listView.contentWidth - listView.width+50
                velocity: 2500
            }
            onClicked:  {
                if (!listView.atXEnd)
                    listView.flick(0, -1000)
            }
        }
    }
}
