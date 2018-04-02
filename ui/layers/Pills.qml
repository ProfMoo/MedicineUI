import QtQuick 2.3
import QtQuick.Window 2.2
import QtQml 2.2
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import "qrc:/objects/"
import "qrc:/global/"

Rectangle {
    id: root
    visible: true
    height: global_vars.height_main
    width: global_vars.width_main - global_vars.sidebar_width

    Component.onCompleted: {
        //root.state = "hidden"
        root.state = "visible"
    }

    states: [
        State {
            name: "visible";
            PropertyChanges {
                target: root;
                visible: true;
                opacity: 1
            }
        },
        State {
            name: "hidden";
            PropertyChanges {
                target: root;
                visible: false;
                opacity: 0
            }
        }
    ]

    Rectangle {
        id: main_page
        anchors.fill: parent
        color: "blue"

        SideButton {
            id: dispense_button

            height_up: 100
            width_up: 100

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            text_up: "Dispense"
        }
    }
}

