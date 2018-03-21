import QtQuick 2.3
import "qrc:/objects"

Rectangle {
    id: root
    objectName: "side_button"

    signal pressed()
    signal released()
    signal clicked()

    property alias height_up: root.height
    property alias width_up: root.width

    color: "#00000000"

    Rectangle {
        id: button
        anchors.fill: parent

        radius: height/2
        color: "black"
    }
}
