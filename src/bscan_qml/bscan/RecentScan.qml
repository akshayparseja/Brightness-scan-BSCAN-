import QtQuick 2.0
import QtQuick.Controls 2.5
import Qt.labs.folderlistmodel 2.12
Rectangle{


    id:demo
     Label{
         width: 156
         height: 29
         anchors.top: parent.top
         anchors.left: parent.left
         anchors.leftMargin: 50
         anchors.topMargin: 30
         font.pixelSize: 25
         font.bold: true

         text:"RECENT SCANS"
     }

    ListView {
        anchors.fill: parent
        orientation: ListView.Horizontal
        spacing: 53
        anchors.left: parent.left

        anchors.right: parent.right
        anchors.rightMargin: 120

        anchors.leftMargin: 120
        id:listView
        add: Transition {
            NumberAnimation { properties: "x,y"; from: 100; duration: 1000 }
        }

        // When scroll end align to the nearest item
        snapMode: ListView.SnapToItem
        // Clip painting to his own bounding rectangle to avoid display
        // data outside specified size during flick
        clip: true


        // Increase Flick speed
        maximumFlickVelocity: 10000
        //            cacheBuffer:1000

        ScrollBar.vertical: ScrollBar {
            id: verticalScrollBar
            active: pressed || listView.moving || listUp.pressed || listDown.pressed
            orientation: Qt.Horizontal
            opacity: active ? 1:0
            Behavior on opacity {NumberAnimation {duration: 500}}

            contentItem: Rectangle {
                implicitWidth: 4
                radius:2
                implicitHeight: parent.height
                //                    color: accentColor
            }
        }
        FolderListModel {
            id: folderModel
            showDirs: true
            showDirsFirst: true
            folder:"file:///home/username/QT PRACTICE/nQmlOpenCV-master/videos/"
            nameFilters: ["*.*"]

        }

        Component {
            id: fileDelegate

            Rectangle {
                id: button
                width:250
                height: 140
                //                        property alias valuedata: scanidvalue.text

                color: "#407899"

                anchors.top: parent.top
                anchors.topMargin: 80

                radius: 40
                property alias texter: buttontext.text
                signal clicked
                Label{
                    id:scanid
                    y: 31
                    text:"SCAN ID:"
                    //        anchors.top: type.top
                    anchors.topMargin: 40
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 20
                    font.bold: true
                    color: "#FFFFFF"
                    Label{
                        color: "#FFFFFF"
                        id:scanidvalue
                        font.pixelSize: 15
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }
                }


                Label{
                    id:p_id
                    color: "#FFFFFF"
                    text:"Patient ID:"
                    anchors.top: scanid.bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 15
                    font.bold: true
                    Label{
                        color: "#FFFFFF"
                        id:p_idvalue
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }
                }
                Label{
                    color: "#FFFFFF"
                    id:genderofpatient
                    text: "Gender:"
                    anchors.top: p_id.bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                    font.pixelSize: 15
                    font.bold: true
                    Label{
                        color: "#FFFFFF"
                        id:gendervalue
                        anchors.left: parent.right
                        anchors.leftMargin: 10

                    }
                }

                Text {
                    visible: false
                    id: buttontext
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    font.bold: true
                    text: fileName
                    anchors.bottomMargin: 20
                }
                MouseArea{


                    anchors.fill: parent
                    onClicked:
                    {


                    }
                }
            }


        }

        model: folderModel
        delegate: fileDelegate
    }


    Rectangle {
        id: upButton
        anchors.left: parent.left
        height: 40
        width: 40
        anchors.leftMargin: 40
        y:parent.height/2
        Image {
            id: rightleft
            rotation: 180

            anchors.right:  parent.right

            height: 40
            width: 40
            //            anchors.rightMargin: 10
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
        y: parent.height/2
       anchors.rightMargin: 40

        Image {
            id: leftright
            anchors.right:  parent.right

            height: 40
            width: 40

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
                to: listView.contentWidth - listView.width
                velocity: 2500
            }
            onClicked:  {
                if (!listView.atXEnd)
                    listView.flick(0, -1000)
            }
        }
    }


}
