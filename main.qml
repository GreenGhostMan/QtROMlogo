import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    width: 1024
    height: 600
    visible: true
    title: qsTr("ROM ROBOTICS")

    Rectangle{
        id: root
        anchors.fill: parent
        color: "black"

        Rectangle { // ------------------------------------------------------------------->  face
            id: faceRect
            color: "#00000000"
            y:-200
            //anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
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
                NumberAnimation on y{
                    to: 300; duration: 5000
                    easing.type: Easing.OutBounce
               }
                RotationAnimation on rotation {
                    from: 300; to: 360
                    direction: RotationAnimation.Shortest
                    duration: 4500
                }
            }
        } // ---------------------------------------------------------------------------------------------------->face

        Rectangle { // ---------------------------------------------------------------------------> base
            id: base
            color: "#00000000"
            implicitWidth: osrfm.implicitWidth
            implicitHeight: romrobot.implicitHeight + osrfm.implicitHeight + 20
            anchors.horizontalCenter: root.horizontalCenter
            y: 400
            //anchors.top: 350
            //anchors.topMargin: 40
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

        }  // ------------------------------------------------------------------------------------------------------> base


    }
}
