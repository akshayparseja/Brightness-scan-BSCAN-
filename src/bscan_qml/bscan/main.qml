import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import Qt.labs.folderlistmodel 2.12
import QtGraphicalEffects 1.0

ApplicationWindow {

    visible: true
    width: 1920
    height: 1080
    id:mainwindown
    signal s_config_generateID(string _id)
    signal s_config_generatePatientID(string _id)

    NavigationPanel{
        id:panel
//        objectName: panel1
    }
    StackView {
        id: stacked
        anchors.left: panel.right
        height: parent.height
        width: parent.width-panel.width


        initialItem: "HomePage.qml"

        pushEnter: Transition {
            id: pushEnter
            ParallelAnimation {
                PropertyAction { property: "x"; value: pushEnter.ViewTransition.item.pos }
                NumberAnimation { properties: "y"; from: pushEnter.ViewTransition.item.pos + stacked.offset;  duration: 400; easing.type: Easing.OutCubic }
                NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.OutCubic }
            }
        }
        popExit: Transition {
            id: popExit
            ParallelAnimation {
                PropertyAction { property: "x"; value: popExit.ViewTransition.item.pos }
                NumberAnimation { properties: "y"; from: popExit.ViewTransition.item.pos; to: popExit.ViewTransition.item.pos + stacked.offset; duration: 400; easing.type: Easing.OutCubic }
                NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 400; easing.type: Easing.OutCubic }
            }
        }

        pushExit: Transition {
            id: pushExit
            PropertyAction { property: "x"; value: pushExit.ViewTransition.item.pos }
            PropertyAction { property: "y"; value: pushExit.ViewTransition.item.pos }
        }
        popEnter: Transition {
            id: popEnter
            PropertyAction { property: "x"; value: popEnter.ViewTransition.item.pos }
            PropertyAction { property: "y"; value: popEnter.ViewTransition.item.pos }
        }
    }
Custom_Popup{
    id:mypopup
    visible: false
}
BscanButtons{
    visible: false
    id:bscanbutton
}

Add_Patient{
    visible: false
    id:add_Patient
}
Add_Doctor{
    visible: false
    id:add_doctor
}


//    Component.onCompleted:
//    { mouse.createDataBase()
//    }
    //    PlayVideo{
    //        id:video
    //    }

}


