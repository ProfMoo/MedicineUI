import QtQuick 2.3
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    objectName: "side_button"

    signal pressed()
    signal released()
    signal clicked()

    property alias height2: root.height
    property alias width2: root.width
    property alias text2: pill_name.text
    property alias text3: pill_time.text

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

        Text {
            id: pill_name
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.height/0.9
            font.pointSize: parent.height/3
            color: "black"
            font.family: "Chocolate"
            text: ""
        }

        Text {
            id: pill_time
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.height/3
            font.pointSize: parent.height/3
            color: "black"
            font.family: "Chocolate"
            text: ""
        }

        Rectangle {
            id: check_box
            anchors.verticalCenter: parent.verticalCenter
            color: "#00000000"
            width: parent.height/1.25
            height: width
            border.color: "black"
            radius: height/6
            border.width: parent.height/30
            anchors.left: parent.left
            anchors.leftMargin: parent.height/8
        }

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
