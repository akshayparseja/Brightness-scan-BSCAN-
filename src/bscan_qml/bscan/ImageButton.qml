import QtQuick 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Rectangle{

    height: 250
    width: 250
    property alias text: buttontext.text
    signal clicked
    radius: 60
    anchors.bottom: parent.bottom
    property alias imgsource: visualImage.source

    Image {
        height: 120.55
        anchors.topMargin: 40

        width: 120.55
        id: visualImage
        anchors.left: parent.left
        anchors.leftMargin: 65
        anchors.right: parent.right
        anchors.rightMargin: 65
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 85
        anchors.top: parent.top
//        anchors.bottom: buttontext.top

    }

    Text {
        width: 95
        height: 35
        id: buttontext
        color: "#407899"
        anchors.top: visualImage.bottom
        anchors.topMargin: 25
        anchors.bottom: parent.bottom
        anchors.leftMargin: 77
        anchors.bottomMargin: 30
        font.pixelSize:20
        font.bold: true

        anchors.left: parent.left

    }

}






