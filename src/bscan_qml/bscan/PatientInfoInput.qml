import QtQuick 2.10
import QtQuick.Controls 2.3
//import QtQuick.VirtualKeyboard 2.1
//import "content"

Rectangle {
    id: rootip
    width: 350
    height: 60
    radius: 8
    border.color: "#97979797"
    color: "#323132"
    border.width: 1
    property alias title: titleText.text
    property alias patientInfor: textname.text
    property alias patientFocus: textname.focus
    property alias validator:textname.validator
    property alias inputMethodHints: textname.inputMethodHints
//    property bool handwritingInputPanelActive: false


    Text {
        id: titleText
        text: ""
        color: "#9b9b9b"
        font.pixelSize: 14
        anchors.left: parent.left
        anchors.leftMargin: 17
        anchors.top: parent.top
        anchors.topMargin: 8
    }
    TextField{


        id: textname
        color: "white"
        width: parent.width - 10*2
        font.pixelSize: 18
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
//        enterKeyAction: EnterKeyAction.Next
        background: Rectangle{
            anchors.fill: parent
            color: "transparent"
            Rectangle{
                width: parent.width - 10
                height: 2.5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 1
                anchors.horizontalCenter: parent.horizontalCenter

                color: textname.focus? "#00C853":"white"
            }

        }

    }

}

