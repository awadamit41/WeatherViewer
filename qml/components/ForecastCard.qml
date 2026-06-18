import QtQuick 2.4
import Ubuntu.Components 1.3

Rectangle {
    id: card

    width: units.gu(12)
    height: units.gu(16)

    radius: units.gu(1.5)

    color: "#2b2d42"

    border.color: "#3c3f58"
    border.width: 1

    property string forecastTime: "09:00"
    property string forecastTemp: "28°C"
    property string forecastIcon: "☀️"

    Column {
        anchors.centerIn: parent
        spacing: units.gu(1)

        Label {
            text: card.forecastTime
            color: "#cbd5e1"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: card.forecastIcon
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: card.forecastTemp
            color: "white"
            fontSize: "large"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

