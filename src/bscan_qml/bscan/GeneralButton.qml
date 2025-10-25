import QtQuick 2.0

Rectangle {
    id: root
    width: 560
    height: 60
    radius: 8

    property color colorPressed: "#BA68C8"
    property color colorNormal: "#03adef"

    property alias text: textbt.text
    signal clicked()

    Text {
        id: textbt
        font.pixelSize: 28
        anchors.centerIn: parent
        color: "white"
    }

    MouseArea{
        id:mousearea
        anchors.fill: parent
        onClicked: {
            root.clicked();
            root.color="#407899"
        }

//        onReleased: root.color = colorNormal
//        onPressed: root.color = colorPressed
    }

}
