import QtQuick 2.3
import QtQuick.Window 2.2
import QtQml 2.2
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
//import QtQuick.Dialogs 1.1
import "qrc:/objects/"
import "qrc:/global/"
import "qrc:/layers/"
//import "qrc:/javascript/connect.js" as Connect

Window {
    id: main_window
    visible: true
    height: global_vars.height_main
    width: global_vars.width_main

    /* Declaring the components */
    GlobalVars{id: global_vars}

    /* Making layers */
    //Pills{id: pills_layer; x:0; y:0}
    Today{id: today_layer; x:global_vars.sidebar_width; y:0}
    Pills{id: pills_layer; x:global_vars.sidebar_width; y:0}
    Schedule{id: schedule_layer; x:global_vars.sidebar_width; y:0}

    Component.onCompleted: {
        today_layer.state = "visible"
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
                    today_layer.state = "visible"
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
                    today_layer.state = "hidden"
                    schedule_layer.state = "visible"
                    pills_layer.state = "hidden"

                    //send signal to connect to function here
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
                    today_layer.state = "hidden"
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

            Timer {
                interval: 1000;
                running: true;
                repeat: true;
                onTriggered: {
                    var current_date = new Date();
                    global_vars.time_date = (current_date.getMonth()+1) + "-" + current_date.getDate() + "-" + current_date.getFullYear();
                    global_vars.time_time = current_date.getHours() + ":" + current_date.getMinutes() + ":" + current_date.getSeconds();
                }
            }

            Text {
                id: time_text
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                text: global_vars.time_date
                font.pointSize: parent.width/8
                font.family: "SaxMono"
                smooth: true
                color: "white"
            }

            Text {
                id: date_text
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: time_text.bottom
                anchors.topMargin: parent.height/10
                text: global_vars.time_time
                font.pointSize: parent.width/8
                font.family: "SaxMono"
                smooth: true
                color: "white"
            }
        }
    }
}

