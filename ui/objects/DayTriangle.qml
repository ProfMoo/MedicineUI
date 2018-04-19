import QtQuick 2.3
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    objectName: "side_button"

    signal pressed()
    signal released()
    signal clicked()
    property alias heightUp: root.height
    property alias widthUp: root.width
    property alias source: btn_image.source

    color: "#00000000"
    //color: "red"

    Image {
        id: btn_image
        anchors.fill: parent
        //anchors.margins: parent.height/5

        source: ''
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
