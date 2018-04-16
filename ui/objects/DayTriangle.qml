import QtQuick 2.3
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    objectName: "side_button"

    signal pressed()
    signal released()
    signal clicked()

    color: "#00000000"

    Rectangle {
        id: info
        height: parent.height
        width: parent.width
        anchors.fill: parent

        z:2

        radius: height/6
        border.color: "black"
        border.width: height/30
        color: "#00000000"

        state: "released"
        states:[
            State {
                name: "pressed";
                PropertyChanges {
                    target: info;
                }
            },
            State {
                name: "released";
                PropertyChanges {
                    target: info;
                }
            }
        ]

        MouseArea {
            id: pill_ma
            anchors.fill: parent
            onPressed: {
                root.pressed()
            }
            onReleased: {
                root.released()
            }
            onClicked: {
                root.clicked()
            }
        }
    }
}
