import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    height: 1080
    width: 1920

    Rectangle {
        id: main_page
        anchors.fill: parent
        //color: "white"

        Rectangle {
            id: side_bar
            height: parent.height
            width: parent.width/6
            color: "#252861"

            anchors.left: parent.left
            
            Rectangle {
                id: button_one
                height: parent.width/1.5
                width: parent.width/1.5
                radius: height/2

                color: "black"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height/12
            }

            Rectangle {
                id: button_two
                height: parent.width/1.5
                width: parent.width/1.5
                radius: height/2

                color: "black"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: button_one.bottom
                anchors.topMargin: button_one.height/3
            }

            Rectangle {
                id: button_three
                height: parent.width/1.5
                width: parent.width/1.5
                radius: height/2

                color: "black"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: button_two.bottom
                anchors.topMargin: button_two.height/3

            }
        }

        Rectangle {
            id: today_page
            height: parent.height
            width: parent.width - side_bar.width

            color: "white"

            anchors.right: parent.right
            anchors.top: parent.top

            Rectangle {
                id: top_box
                height: parent.height/6
                width: parent.width/1.2

                color: "white"

                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: height/3

                Text {
                    id: today
                    text: "Today"
                    font.pointSize: parent.height/1.2

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }

                Rectangle {
                    id: left_day
                    height: parent.height
                    width: height

                    color: "black"

                    anchors.left: parent.left
                }

                Rectangle {
                    id: right_day
                    height: parent.height
                    width: height

                    color: "black"

                    anchors.right: parent.right
                }
            }

            Rectangle {
                id: bottom_box
                height: parent.height/1.4
                width: parent.width/1.2

                color: "red"

                anchors.top: top_box.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    id: med
                    height: parent.height/4
                    width: parent.width

                    color: "black"

                    anchors.top: parent.top
                    anchors.topMargin: parent.height/10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}

