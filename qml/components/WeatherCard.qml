import QtQuick 2.4
import Ubuntu.Components 1.3
Rectangle {
    id: card
    width: parent.width * 0.9
    height: units.gu(26)
    radius: units.gu(2)
    color: "#2b2d42"
    border.color: "#3c3f58"
    border.width: 1
    opacity: 0
    property string city: "Pune"
    property string temperature: "--°C"
    property string condition: "Clear"
    property string humidity: "--%"
    property string icon: "☀️"
    SequentialAnimation {
        running: true
        NumberAnimation {
            target: card
            property: "opacity"
            from: 0
            to: 1
            duration: 800
        }
        NumberAnimation {
            target: card
            property: "scale"
            from: 0.9
            to: 1.0
            duration: 400
        }
    }
    Column {
        anchors.centerIn: parent
        spacing: units.gu(1)
        Label {
            text: card.city
            fontSize: "x-large"
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            id: weatherIcon
            text: card.icon
            font.pixelSize: 54
            anchors.horizontalCenter: parent.horizontalCenter
            SequentialAnimation on scale {
                loops: Animation.Infinite
                running: true
                NumberAnimation {
                    from: 1.0
                    to: 1.15
                    duration: 1200
                }
                NumberAnimation {
                    from: 1.15
                    to: 1.0
                    duration: 1200
                }
            }
        }
        Label {
            text: card.temperature
            font.pixelSize: 36
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            text: card.condition
            color: "#cbd5e1"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            text: "Humidity: " + card.humidity
            color: "#94a3b8"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
