
import QtQuick 2.0
import QtQuick.Controls 2.0

Popup {
    id: config
    x: (mainwindown.width - width) / 2
    y: Math.abs(mainwindown.height - height) / 2
    closePolicy: Popup.NoAutoClose
    modal: true
    focus: true

    property alias out: titleid.text


    Rectangle{
        width: 400
        height: 250
        color: "lightgreen"
        radius: 50
        anchors.centerIn: parent
        Text {
            id: titleid
            font.pixelSize: 26
            color: "Black"
            anchors.centerIn: parent
            text: out
        }



        Row{
            id: rowbt
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 20

            FlatButton{

                text: "OKAY"
                textColor:"Red"
                onClicked: {
                    config.close()
                }
            }

        }

    }
}
