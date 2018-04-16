import QtQuick 2.3
import QtQuick.Window 2.2
import QtQml 2.2
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
//import QtQuick.Dialogs 1.1
import "qrc:/objects/"
import "qrc:/global/"
import "qrc:/layers/"

Window {
    id: main_window
    visible: true
    height: global_vars.height_main
    width: global_vars.width_main

    /* Declaring the components */
    GlobalVars{id: global_vars}

    /* Making layers */
    //Pills{id: pills_layer; x:0; y:0}
    Pills{id: pills_layer; x:global_vars.sidebar_width; y:0}
    Schedule{id: schedule_layer; x:global_vars.sidebar_width; y:0}

    Component.onCompleted: {
        main_page.state = "visible"
        //main_page.state = "hidden"
    }

    FontLoader {
        id: main_font
        name: "SaxMono"
        source: "qrc:/typefaces/saxmono.ttf"
    }

    FontLoader {
        id: top_font
        name: "Chocolate"
        source: "qrc:/typefaces/chocolate.otf"
    }

    Rectangle {
        id: main_page
        anchors.fill: parent
        color: "#00000000"

        states: [
            State {
                name: "visible";
                PropertyChanges {
                    target: today_page;
                    visible: true;
                    opacity: 1
                }
            },
            State {
                name: "hidden";
                PropertyChanges {
                    target: today_page;
                    visible: false;
                    opacity: 0
                }
            }
        ]

        Rectangle {
            id: side_bar
            height: parent.height
            width: global_vars.sidebar_width
            color: "#252861"

            anchors.left: parent.left
            
            SideButton {
                id: button_one

                height_up: parent.width/1.5
                width_up: height

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height/12

                onClicked: {
                    main_page.state = "visible"
                    pills_layer.state = "hidden"
                    schedule_layer.state = "hidden"
                }

                icon: "qrc:/images/home.png"
            }

            SideButton {
                id: button_two

                height_up: parent.width/1.5
                width_up: height

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: button_one.bottom
                anchors.topMargin: button_one.height/3

                onClicked: {
                    main_page.state = "hidden"
                    schedule_layer.state = "visible"
                    pills_layer.state = "hidden"
                    Qt.quit()
                }

                icon: "qrc:/images/calendar.png"
            }

            SideButton {
                id: button_three

                height_up: parent.width/1.5
                width_up: height

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: button_two.bottom
                anchors.topMargin: button_two.height/3

                onClicked: {
                    //console.log("wtfff")
                    main_page.state = "hidden"
                    schedule_layer.state = "hidden"
                    pills_layer.state = "visible"
                    //console.log("wtfff2")
                }

                icon: "qrc:/images/pills.png"
            }
        }

        Rectangle {
            id: clock
            height: parent.height/6
            width: side_bar.width
            color: "#00000000"
            //color: "red"

            anchors.bottom: parent.bottom
            anchors.horizontalCenter: side_bar.horizontalCenter

            Text {
                id: time_text
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                text: "2:08 PM"
                font.pointSize: parent.width/7
                font.family: "SaxMono"
                smooth: true
                color: "white"
            }

            Text {
                id: date_text
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: time_text.bottom
                anchors.topMargin: parent.height/10
                text: "Wed, Jan 3"
                font.pointSize: parent.width/10
                font.family: "SaxMono"
                smooth: true
                color: "white"
            }
        }

        Rectangle {
            id: today_page
            height: parent.height
            width: parent.width - side_bar.width

            color: "#00000000"

            anchors.right: parent.right
            anchors.top: parent.top

            SideButton {
                id: add_button

                height_up: 20
                width_up: height

                anchors.right: main_window.right
                anchors.top: main_window.top

                onClicked: {
                    pill_model.insert(pill_listview.currentIndex + 1, {"heightUp": today_page.height/5, "widthUp": bottom_box.width, "textUp": "Xanax", "textUp2": "9:00AM"})
                    pill_listview.currentIndex += 1
                }

                z: 2
            }

            Rectangle {
                id: top_box
                height: parent.height/6
                width: parent.width/1.2

                color: "#00000000"

                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: height/3

                z: 1

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

                color: "#00000000"
                //color: "red"

                anchors.top: top_box.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                ListModel {
                    id: pill_model
                }

                Component {
                    id: pill_delegate
                    PillInfo {
                        height2: heightUp
                        width2: widthUp
                        text2: textUp
                        text3: textUp2
                    }
                }

                ListView {
                    id: pill_listview
                    anchors.fill: parent
                    anchors.topMargin: today_page.height/15
                    //anchors.rightMargin: today_page.width/4
                    delegate: pill_delegate
                    model: pill_model
                    spacing: parent.height/20
                    clip: true

//                    ScrollBar.vertical: ScrollBar {
//                        active: true
//                        interactive: true
//                        orientation: Qt.Vertical
//                        policy: ScrollBar.AsNeeded
//                        parent: pill_listview.parent
//                        anchors.top: parent.top
//                        anchors.left: parent.right
//                        anchors.leftMargin: 2
//                    }
                }

                Rectangle {
                    id: med
                    height: parent.height/4
                    width: parent.width

                    color: "#00000000"

                    anchors.top: parent.top
                    anchors.topMargin: parent.height/10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}

