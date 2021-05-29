import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    width: 1000
    height: 1000
    visible: true
    title: qsTr("ROM ROBOTICS")

    Rectangle{
        id: root
        anchors.fill: parent
        color: "black"

        Rectangle { // ------------------------------------------------------------------------------------------->  face
            id: faceRect
            color: "#00000000"
            x: -200; y:-200
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: face.implicitWidth; implicitHeight: face.implicitHeight

            Image{
                id: face
                source: "face.png"

                Image{
                    id: eyeOuter
                    source: "eye-outer.png"
                    anchors.horizontalCenter: face.horizontalCenter
                    anchors.verticalCenter: face.verticalCenter

                    Image{
                        id: eyeball
                        source: "eye.png"
                    }
                }
                            PathAnimation{
                                target: faceRect
                                orientation: PathAnimation.TopFirst
                                anchorPoint: Qt.point( faceRect.width/2, faceRect.height/2 )
                                path:  Path {
                                    startX: 100; startY: root.height/2

                                    PathCubic {
                                        id: part1
                                        x: root.width - 100
                                        y: root.height / 2
                                        control1X: 100; control1Y: 0
                                        control2X: x; control2Y: root.height
                                    }
                                }
                            }
                //---------------------------------------------------
//                RotationAnimation on rotation {
//                    from: 180; to: 360
//                    direction: RotationAnimation.Shortest
//                    duration: 1000
//                    easing.type: Easing.OutBack
//                }
            }
        } // ------------------------------------------------------------------------------------------------------>face

        Rectangle { // -----------------------------------------------------------------------------------------------------------> base
            id: base
            color: "#00000000"
            implicitWidth: osrfm.implicitWidth
            implicitHeight: romrobot.implicitHeight + osrfm.implicitHeight + 20
            anchors.horizontalCenter: root.horizontalCenter
            anchors.top: faceRect.bottom
            anchors.topMargin: 40
            Image{
                id: romrobot
                source: "romrobotics.png"
                anchors.top: base.top
            }

            Image{
                id: osrfm
                source: "osrfm.png"
                anchors.bottom: base.bottom
            }
//-------------------------------------------------------------------------
//            PathAnimation{
//                target: base
//                orientation: PathAnimation.TopFirst
//                anchorPoint: Qt.point( base.width/2, base.height/2 )
//                path:  Path {
//                    startX: 100; startY: window.height/2

//                    PathCubic {
//                        id: part1
//                        x: window.width - 100
//                        y: window.height / 2
//                        control1X: 100; control1Y: 0
//                        control2X: x; control2Y: window.height
//                    }
//                }
//            }
//--------------------------------------------------------------------------
//            ParallelAnimation{
//                NumberAnimation {
//                    target: base; properties: "scale"
//                    from: 0.5; to: 1.0; duration: 2000
//                }
//                 NumberAnimation {
//                     target: base; properties: "opacity"
//                     from: 0.0; to: 1.0; duration: 2000
//                 }
//            }
//---------------------------------------------------------------------------
        }  // ---------------------------------------------------------------------------------------------------------------------> base


    }
}
