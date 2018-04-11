import QtQuick 2.3
//import QtGraphicalEffects 1.0

Rectangle {
    id: root
    objectName: "side_button"

    signal pressed()
    signal released()
    signal clicked()

    property alias height_up: root.height
    property alias width_up: root.width
    property alias icon: btn_image.source
    property alias text_up: btn_text.text

    color: "#00000000"

    Rectangle {
        id: button
        height: parent.height
        width: parent.width
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0

        z:2

        radius: height/2
        color: "#506AB4"

        state: "released"
        states:[
            State {
                name: "pressed";
                PropertyChanges {
                    target: button;
                    anchors.topMargin: height/20
                    anchors.leftMargin: height/20
                }
            },
            State {
                name: "released";
                PropertyChanges {
                    target: button;
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                }
            }
        ]

        Image {
            id: btn_image
            anchors.fill: parent
            anchors.margins: parent.height/5

            source: ''
        }

        Text {
            id: btn_text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: parent.height/4
            color: "white"
            text: ""
        }

        MouseArea {
            id: btn_ma
            anchors.fill: parent
            onPressed: {
                root.pressed()
                btn_shadow.state = "hidden"
                button.state = "pressed"
            }
            onReleased: {
                root.released()
                btn_shadow.state = "visible"
                button.state = "released"
            }
            onClicked: {
                root.clicked()
            }
        }
    }

    Rectangle {
        id: btn_shadow
        anchors.fill: button
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height/2
        anchors.leftMargin: parent.width/2
        height: parent.height
        width: parent.width
        color: "black"
        opacity: 0.5
        z: 1
        radius: height/2

        state: "visible"
        states:[
            State {
                name: "visible";
                PropertyChanges {
                    target: btn_shadow;
                    visible: true;
                    opacity: 0.5
                    anchors.horizontalCenterOffset: parent.height/12
                    anchors.verticalCenterOffset: parent.width/12
                }
            },
            State {
                name: "hidden";
                PropertyChanges {
                    target: btn_shadow;
                    visible: false;
                    opacity: 0
                    anchors.horizontalCenterOffset: 0
                    anchors.verticalCenterOffset: 0
                }
            }
        ]
    }
}
