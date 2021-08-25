import QtQuick 2.7

Item {

    // ----- Public Properties ----- //

    property int radius: 150
    property color color: "#FAFAFA"
    property bool useCircle: true
    property  var c_progress: 0
    property alias running: timer.running

    // ----- Private Properties ----- //

    property int _innerRadius: radius * 0.8
    property int _currentIndex: 0

    property var numberOfCircles: 25

    property var color1: "#80b9ff"
    property var color2: "#46fa32"


    id: root
    width: radius * 2
    height: radius * 2

    Repeater {
        id: repeater
        model: root.numberOfCircles
        anchors.centerIn: parent.Center
        delegate: Component {
            Rectangle {
                // ----- Private Properties ----- //
                property int _rotation: (360 / repeater.model) * index
                property var changeDetecotor: root._currentIndex


                onChangeDetecotorChanged:  {
                    let remain = index;

                    if(_currentIndex > numberOfCircles){
                        let allowdDevision =Math.floor(_currentIndex/numberOfCircles)*numberOfCircles ;

                        remain = allowdDevision + index

                    }

                    let _maxIndex= changeDetecotor+2
                    let _minIndex= changeDetecotor-2



                    if((remain<=_maxIndex && remain >=_minIndex)
                            ||(remain+numberOfCircles<=_maxIndex && remain+numberOfCircles >=_minIndex)){
                        a11.start();
                        a22.stop();
                        a1.start();
                        a2.stop();
                    }
                    else{
                        a22.start();
                        a11.stop();
                        a2.start();
                        a1.stop()
                    }
                }

                width: 5
                height: 15
                x: _getPosOnCircle(_rotation).x
                y: _getPosOnCircle(_rotation).y
                radius: 100
                color: (index+1 <= root.c_progress/4) ? color2 : color1
                transform: Rotation {
                    angle: 360 - _rotation
                    origin {
                        x: 0
                        y: height / 2
                    }
                }
                transformOrigin: index >= repeater.model / 2 ? Item.Center : Item.Center

                NumberAnimation on opacity {
                    id:a11
                    duration: 200
                    to:1
                }
                NumberAnimation on opacity {
                    id:a22
                    duration: 2400
                    to:0
                }
                NumberAnimation on width {
                    id:a1
                    duration: 220;to:22
                }
                NumberAnimation on width {
                    id:a2
                    duration: 1600;to:5
                    easing.type: Easing.OutInQuint
                }
                Behavior on color{ColorAnimation{duration: 1000}}

            }
        }
    }

    Timer {
        id: timer
        interval: 100
        repeat: true
        running: true
        onTriggered: {
            if (root._currentIndex === 50000000) {
                root._currentIndex = 0;
            }
            else {
                root._currentIndex++;
            }
        }
    }

    // ----- Private Functions ----- //

    function _toRadian(degree) {
        return (degree * 3.14159265) / 180.0;
    }

    function _getPosOnCircle(angleInDegree) {
        var centerX = root.width / 2, centerY = root.height / 2;
        var posX = 0, posY = 0;

        posX = centerX + root._innerRadius * Math.cos(_toRadian(angleInDegree));
        posY = centerY - root._innerRadius * Math.sin(_toRadian(angleInDegree));
        return Qt.point(posX, posY);
    }
}
