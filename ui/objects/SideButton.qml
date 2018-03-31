import QtQuick 2.3
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    objectName: "side_button"

    signal pressed()
    signal released()
    signal clicked()

    property alias height_up: root.height
    property alias width_up: root.width
    property alias icon: btn_image.source

    color: "#00000000"

    Rectangle {
        id: button
        height: parent.height
        width: parent.width
        anchors.topMargin: 0
        anchors.leftMargin: 0

        radius: height/2
        color: "#506AB4"

        state: "released"
            states:[
                State {
                    name: "pressed";
                    PropertyChanges {
                        target: button;
                        anchors.topMargin: height/10
                        anchors.leftMargin: height/10
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

    DropShadow {
        id: btn_shadow
        anchors.fill: button
        horizontalOffset: parent.height/12
        verticalOffset: parent.width/12

        radius: 3.0
        samples: 7
        source: button
        transparentBorder: true

        color: "#80000000"

        state: "visible"
        states:[
            State {
                name: "visible";
                PropertyChanges {
                    target: btn_shadow;
                    visible: true;
                    opacity: 1
                }
            },
            State {
                name: "hidden";
                PropertyChanges {
                    target: btn_shadow;
                    visible: false;
                    opacity: 0
                }
            }
        ]
    }
}
