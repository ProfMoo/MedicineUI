import QtQuick 2.3
import QtQuick.Window 2.2
import QtQml 2.2
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import "qrc:/objects/"

Rectangle {
    id: root
    visible: true
    height: global_vars.height_main
    width: global_vars.width_main - global_vars.sidebar_width

    color: "#00000000"

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
        id: today_page
        height: parent.height
        width: parent.width

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
                if (bottom_box.state == "yesterday") {
                    pill_model_yesterday.insert(pill_listview_yesterday.currentIndex + 1, {"heightUp": today_page.height/5, "widthUp": bottom_box.width, "textUp": "Aspirin", "textUp2": "9:00AM"})
                    pill_listview_yesterday.currentIndex += 1
                }
                else if (bottom_box.state == "today") {
                    pill_model_today.insert(pill_listview_today.currentIndex + 1, {"heightUp": today_page.height/5, "widthUp": bottom_box.width, "textUp": "Aspirin", "textUp2": "9:00AM"})
                    pill_listview_today.currentIndex += 1
                }
                else if (bottom_box.state == "tomorrow") {
                    pill_model_tomorrow.insert(pill_listview_tomorrow.currentIndex + 1, {"heightUp": today_page.height/5, "widthUp": bottom_box.width, "textUp": "Aspirin", "textUp2": "9:00AM"})
                    pill_listview_tomorrow.currentIndex += 1
                }
            }

            z: 2
        }

        SideButton {
            id: exit_button

            height_up: 20
            width_up: height

            anchors.left: add_button.right
            anchors.leftMargin: 10
            anchors.top: main_window.top

            onClicked: {
                Qt.quit()
            }
        }

//        SideButton {
//            id: get_str

//            height_up: 20
//            width_up: height

//            anchors.left: exit_button.right
//            anchors.leftMargin: 10
//            anchors.top: main_window.top

//            onClicked: {
//                fileiofunc("1|3");
//            }
//        }

//            SideButton {
//                id: send_str

//                height_up: 20
//                width_up: height

//                anchors.left: get_str.right
//                anchors.leftMargin: 10
//                anchors.top: main_window.top

//                onClicked: {
//                    //save("test.txt", "ayylmao");
//                }
//            }

        Rectangle {
            id: top_box
            height: parent.height/6
            width: parent.width/1.08

            color: "#00000000"

            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: height/3

            z: 1

            Text {
                id: today
                text: "Today"
                font.pointSize: parent.height/1.25

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            DayTriangle {
                id: left_day
                heightUp: parent.height
                widthUp: height

                source: "qrc:/images/arrow-left.svg"
                onPressed: {
                    source = "qrc:/images/arrow-left-gray.png"
                }
                onReleased: {
                    source = "qrc:/images/arrow-left.svg"
                    if (today.text == "Today") {
                        today.text = "Yesterday"
                        bottom_box.state = "yesterday"
                    }
                    else if (today.text == "Tomorrow") {
                        today.text = "Today"
                        bottom_box.state = "today"
                    }
                }

                anchors.left: parent.left
            }

            DayTriangle {
                id: right_day
                heightUp: parent.height
                widthUp: height

                source: "qrc:/images/arrow-right.svg"
                onPressed: {
                    source = "qrc:/images/arrow-right-gray.png"
                }
                onReleased: {
                    source = "qrc:/images/arrow-right.svg"
                    if (today.text == "Yesterday") {
                        today.text = "Today"
                        bottom_box.state = "today"
                    }
                    else if (today.text == "Today") {
                        today.text = "Tomorrow"
                        bottom_box.state = "tomorrow"
                    }
                }

                anchors.right: parent.right
            }
        }

        Rectangle {
            id: bottom_box
            height: parent.height/1.4
            width: parent.width/1.1

            color: "#00000000"
            //color: "red"

            anchors.top: top_box.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            state: "today"
            states: [
                State {
                    name: "yesterday";
                    PropertyChanges {
                        target: pill_listview_yesterday;
                        opacity: 1
                        z: 3
                    }
                    PropertyChanges {
                        target: pill_listview_today;
                        opacity: 0
                        z: 2
                    }
                    PropertyChanges {
                        target: pill_listview_tomorrow;
                        opacity: 0
                        z: 1
                    }
                },
                State {
                    name: "today";
                    PropertyChanges {
                        target: pill_listview_yesterday;
                        opacity: 0
                        z: 1
                    }
                    PropertyChanges {
                        target: pill_listview_today;
                        opacity: 1
                        z: 3
                    }
                    PropertyChanges {
                        target: pill_listview_tomorrow;
                        opacity: 0
                        z: 2
                    }
                },
                State {
                    name: "tomorrow";
                    PropertyChanges {
                        target: pill_listview_yesterday;
                        opacity: 0
                        z: 2
                    }
                    PropertyChanges {
                        target: pill_listview_today;
                        opacity: 0
                        z: 1
                    }
                    PropertyChanges {
                        target: pill_listview_tomorrow;
                        opacity: 1
                        z: 3
                    }
                }
            ]

            ListModel {
                id: pill_model_yesterday
            }

            ListModel {
                id: pill_model_today
            }

            ListModel {
                id: pill_model_tomorrow
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
                id: pill_listview_yesterday
                anchors.fill: parent
                anchors.topMargin: today_page.height/15
                //anchors.rightMargin: today_page.width/4
                delegate: pill_delegate
                model: pill_model_yesterday
                spacing: parent.height/20
                clip: true

                opacity: 0
            }

            ListView {
                id: pill_listview_today
                anchors.fill: parent
                anchors.topMargin: today_page.height/15
                //anchors.rightMargin: today_page.width/4
                delegate: pill_delegate
                model: pill_model_today
                spacing: parent.height/20
                clip: true

                opacity: 0
            }

            ListView {
                id: pill_listview_tomorrow
                anchors.fill: parent
                anchors.topMargin: today_page.height/15
                //anchors.rightMargin: today_page.width/4
                delegate: pill_delegate
                model: pill_model_tomorrow
                spacing: parent.height/20
                clip: true

                opacity: 0
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


