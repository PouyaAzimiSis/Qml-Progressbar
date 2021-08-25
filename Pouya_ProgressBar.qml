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
        
        function cmyk2rgb(c, m, y, k){
        c = (c / 100);
        m = (m / 100);
        y = (y / 100);
        k = (k / 100);

        c = c * (1 - k) + k;
        m = m * (1 - k) + k;
        y = y * (1 - k) + k;

        var r = 1 - c;
        var g = 1 - m;
        var b = 1 - y;

        if(true){
            r = Math.round(255 * r);
            g = Math.round(255 * g);
            b = Math.round(255 * b);
        }
        r = toHex(r)
        g = toHex(g)
        b =  toHex(b)



        let answer = "#"+ r + g + b
        console.log(answer)
        return answer

        }


    }
