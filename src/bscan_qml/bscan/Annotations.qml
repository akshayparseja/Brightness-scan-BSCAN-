
import QtQuick.Controls 2.7
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

import QtQuick 2.12
import Qt.labs.folderlistmodel 2.12


import QtMultimedia 5.0

Rectangle {

    width: 1920
    height: 1080
    visible: true
    id:mainwindow
    color: "#F7F7F7"

    Rectangle {
        color: "black"
        width:1024
        height: 950
        id:rect
        property int type: -1
        property int count: 0
        property int count1: 0
        property double distance: 0
        property string filename: ""
        Component.onCompleted: {
            canvas.clear()
        }

        Item {
            //            anchors.top:
            anchors.fill: parent

            anchors.bottom: rect.bottom

            Image {
                id: annnote

            }


            Item
            {
                id: mainContainer
                height: parent.height
                width: parent.width

                Rectangle{
                    width: parent.width
                    height:40
                    color: "#07d7c9"
                    radius: 10
                    id:toprow

                    Row{  spacing: 1
                        width: parent.width
                        height: parent.height

                        Button{
                            id:clear


                            text: "clear"

                            onClicked:{

                                canvas.clear()
                            }
                        }
                        Button{
                            visible: false
                            id:meta
                            onClicked:{

                                mouse.metaData(rect.filename)
                                mouse.clear()
                            }
                        }
                        Button{
                            id:save


                            text: "SAVE"
                            onClicked: {

                                mouse.save(rect.filename);

                            }
                        }

                        ComboBox {
                            id: cmbPeople
                            height: parent.height
                            width: 200
                            textRole: "text"

                            model: ListModel {
                                id: listmodel
                                ListElement {text: "Select One"}

                                ListElement {text: "Point"}
                                ListElement {text: "Line"}

                                ListElement {text: "area"}
                                //                                ListElement {text: "Re-draw"}
                            }

                            onCurrentIndexChanged: {
                                //                                redraw.visible=false
                                if(cmbPeople.currentIndex==1){


                                }
                                else if(cmbPeople.currentIndex==2){

                                }
                                else if(cmbPeople.currentIndex==3){

                                }
                                //                                if(cmbPeople.currentIndex==3){
                                //                                    canvas.clear()
                                //                                    rect.count1=0
                                //                                    redraw.visible=true
                                //                                }

                                rect.type=cmbPeople.currentIndex-1

                            }
                        }


                        RowLayout{
                            id:redraw
                            //                            visible: false
                            Switch {
                                id: element
                                text: qsTr("Points")

                                onToggled: {
                                    if(checked) {

                                        canvas.requestPaint()

                                    }
                                    else{
                                        console.log("clear")
                                        canvas.clear()

                                        canvas.requestPaint()
                                    }
                                }
                            }
                            Switch {
                                id: element1
                                text: qsTr("Line")

                                onToggled: {
                                    if(checked) {

                                        canvas.requestPaint()
                                    }
                                    else{

                                        console.log("clear")
                                        canvas.clear()

                                        canvas.requestPaint()
                                    }
                                }

                            }
                            Switch {
                                id: element2
                                text: qsTr("Area")


                                onToggled: {
                                    if(checked) {

                                        canvas.requestPaint()
                                    }
                                    else{

                                        console.log("clear")
                                        canvas.clear()

                                        canvas.requestPaint()
                                    }
                                }

                            }
                        }
                    }
                }
                TextField{
                    id:texthere
                    x:area.mouseX
                    y:area.mouseY
//                    focus: true
                    visible: false
                    onAccepted:
                    {
                        visible=false
                        if(rect.type===0){

                            mouse.addPoint(canvas.lastx,canvas.lasty,text,rect.filename)
                            texthere.text=""

                        }
                        else if(rect.type===1){
                            var a = canvas.lastx1 - canvas.lastx;
                            var b = canvas.lasty1 - canvas.lasty;
                            var c = Math.hypot(a,b);

                            mouse.addLine(canvas.lastx1,canvas.lastx,canvas.lasty1,canvas.lasty,c,text,rect.filename)


                            texthere.text=""
                        }
                        else if(rect.type===2){

                            mouse.addSurface(-1,-1,text,rect.filename)
                            texthere.text=""
                            canvas.clear()
                        }
                    }
                }




                Canvas
                {


                    id: canvas
                    anchors.fill: parent

                    property int lastx: -1
                    property int lasty: -1
                    property int lastx1: -1
                    property int lasty1: -1

                    anchors.topMargin: 46
                    function clear(){

                        const context = canvas.getContext('2d');

                        context.reset()

                        requestPaint()
                    }

                    onPaint:
                    {
                        var ctx =getContext("2d")


                        if(element.checked){

                            var aa=mouse.reDraw(0,rect.filename)
                            console.log(aa)
                            for(var i=0;i<aa.length-1;i=i+2){
                                console.log(aa[i],aa[i+1])
                                ctx.beginPath();

                                ctx.arc(aa[i],aa[i+1], 4,0, 2 * Math.PI);
                                ctx.fillStyle = "red";
                                ctx.fill();
                                ctx.stroke();


                            }
                        }
                        if(element1.checked){


                            var a1=mouse.reDraw(1,rect.filename)
                            console.log(a1)
                            for(var ii=0;ii<a1.length-1;ii=ii+4){
                                console.log(a1[ii],a1[ii+1])
                                ctx.lineWidth=2
                                ctx.strokeStyle = "blue"
                                ctx.beginPath()

                                ctx.arc(a1[ii],a1[ii+1], 4,0, 2 * Math.PI);
                                ctx.fillStyle = "red";
                                ctx.fill();
                                ctx.stroke();

                                ctx.moveTo(a1[ii],a1[ii+1])
                                lastx=area.mouseX
                                lasty=area.mouseY
                                ctx.lineTo(a1[ii+2],a1[ii+3])
                                ctx.arc(a1[ii+2],a1[ii+3], 4,0, 2 * Math.PI);
                                ctx.fillStyle = "red";
                                ctx.fill();
                                ctx.stroke();


                            }
                        }
                        if(element2.checked){


                            var areashape=mouse.reDraw(2,rect.filename)
                            console.log(areashape)
                            for(var i2=2;i2<areashape.length-2;i2=i2+2){
                                console.log(areashape[i2],areashape[i2+1])


                                ctx.lineWidth=2
                                ctx.strokeStyle = "blue"

                                ctx.beginPath();
                                if(areashape[i2+4]===-1){
                                    i2+=6

                                }
                                else{
                                    ctx.moveTo(areashape[i2],areashape[i2+1])


                                    ctx.lineTo(areashape[i2+2],areashape[i2+3])
                                    ctx.stroke();
                                }
                            }
                            ctx.stroke()
                        }

                        if(rect.type===2 ){


                            ctx.lineWidth=2
                            ctx.strokeStyle = "blue"

                            ctx.beginPath();
                            ctx.moveTo(lastx,lasty)
                            lastx=area.mouseX
                            lasty=area.mouseY

                            ctx.lineTo(lastx1,lasty1)
                            mouse.addSurface(lastx,lasty,"","")
                            ctx.stroke()

                        }

                        if(rect.type===1 ){

                            rect.count1=1
                            ctx.lineWidth=2
                            ctx.strokeStyle = "blue"
                            ctx.beginPath();

                            ctx.arc(lastx,lasty, 4,0, 2 * Math.PI);
                            ctx.fillStyle = "red";
                            ctx.fill();
                            ctx.stroke();

                            ctx.moveTo(lastx,lasty)
                            lastx=area.mouseX
                            lasty=area.mouseY
                            ctx.lineTo(lastx1,lasty1)
                            ctx.arc(lastx1,lasty1, 4,0, 2 * Math.PI);
                            ctx.fillStyle = "red";
                            ctx.fill();
                            ctx.stroke();


                        }


                        if(rect.type===0){
                            rect.count1=0

                            texthere.focus=true

                            ctx.lineWidth=2
                            ctx.strokeStyle = "blue"
                            ctx.beginPath()

                            ctx.arc(area.mouseX,area.mouseY, 4,0, 2 * Math.PI);
                            ctx.fillStyle = "red";
                            ctx.fill();
                            ctx.stroke();
                        }

                    }
                    MouseArea{
                        id:area
                        anchors.fill: parent
                        onClicked: {
                            if(rect.type===1){
                                canvas.lastx=mouseX
                                canvas.lasty=mouseY
                            }
                        }

                        onPressed:   {
                            if(rect.type===1){
                                texthere.visible=false
                            }
                          else  if(rect.type===2){
                                canvas.lastx=mouseX
                                canvas.lasty=mouseY
                                texthere.visible=false
                            }


                          else  if(rect.type===0){
                                canvas.lastx=mouseX
                                canvas.lasty=mouseY
                                canvas.lastx1=mouseX
                                canvas.lasty1=mouseY
                                canvas.requestPaint()
                                texthere.visible=true
                                texthere.focus=true
                            }
                        }
                        onPositionChanged: {


                            if(rect.type===2){
                                canvas.lastx1=mouseX
                                canvas.lasty1=mouseY
                                canvas.requestPaint()
                            }

                        }
                        onReleased: {
                            if(rect.type===1){

                                if(rect.count==0){
                                    rect.count=1
                                    console.log(rect.count,canvas.lastx1)
                                    canvas.lastx1=mouseX
                                    canvas.lasty1=mouseY
                                    canvas.requestPaint()

                                }
                                else if(rect.count==1){
                                    rect.count=0
                                    console.log(rect.count)
                                    canvas.lastx=mouseX
                                    canvas.lasty=mouseY
                                    canvas.requestPaint()
                                    texthere.visible=true
                                    texthere.focus=true


                                }
                            }
                            if(rect.type===2){

                                texthere.visible=true
                                texthere.focus=true
                            }

                        }

                    }

                }
            }
        }
    }

    Row  {
        id:rowlay
        width: parent.width
        //      anchors.top: rect.bottom
        anchors.right: rect.right
        anchors.left: rect.left
        anchors.top: rect.bottom
        height: mainwindow.height-rect.height
        anchors.leftMargin: 10
        anchors.bottom: mainwindown.bottom
        anchors.bottomMargin: 15
        ScrollView{
            smooth: true
            clip: true
            anchors.fill:parent
            anchors.bottomMargin: 10

            ListView {
                x: 21
                y: 962
                //                width: 1003
                //                height: 118

                anchors.fill: parent
                orientation: ListView.Horizontal
                spacing: 25
                FolderListModel {
                    id: folderModel
                    showDirs: true
                    showDirsFirst: true
                    folder:"src/bscan_qml/bscan/images"
                    nameFilters: ["*.*"]

                }

                Component {
                    id: fileDelegate

                    Item {
                        id: button
                        width: 150
                        height: 100
                        property alias texter: buttontext.text
                        signal clicked

                        Image {
                            id: visualImage
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: buttontext.top
                            source: "qrc:/images/bscan.jpeg"
                        }

                        Text {
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

                                rect.filename=texter

                                annnote.source= folderModel.folder+texter

                                canvas.clear()
                                meta.clicked()




                            }
                        }
                    }


                }

                model: folderModel
                delegate: fileDelegate
            }

        }
    }

//    ColumnLayout{
//        anchors.left:rowlay.right
//        anchors.right: parent.right
//        y:mainWindow.height/2

//        Button{
//            focus: true
//            text: "PLAY VIDEO"
//            onClicked: {
//                var component = Qt.createComponent("PlayVideo.qml");
//                win = component.createObject(mainwindown);
//                win.show();

//            }

//        }
//    }
}







