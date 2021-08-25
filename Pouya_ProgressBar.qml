import QtQuick 2.0
import QtGraphicalEffects 1.0

C_Spinner {
        property var: progress
        c_progress: progress
        anchors.centerIn: parent
        Item{
            width: 150
            height: 80
            anchors.centerIn: parent

            Text{
                id: counter
                anchors.fill: parent
                anchors.topMargin: 9
                anchors.leftMargin: 5
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text:{
                    if(progress < 100){
                        counter.font.pixelSize = 40;
                        return progress+"%"
                    }
                    else{
                        counter.font.pixelSize = 26;

                        return "Finished!"
                    }
                }

                font.pixelSize: 40
                font.bold: true
                //font.family: "fontello"
                color: cmyk2rgb(progress,0,progress,30)
                opacity: 0.8
                Behavior on color{ColorAnimation{duration: 1000}}

            }
        }



    }