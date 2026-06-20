import QtQuick 2.4
import Ubuntu.Components 1.3

Rectangle {
    id: card

    width: units.gu(34)
    height: units.gu(28)

    radius: units.gu(2)

    color: "#2b2d42"

    border.color: "#4a4e69"
    border.width: 1

    property string city: "Pune"
    property string temperature: "--°C"
    property string condition: "Clear"
    property string humidity: "--%"
    property string icon: "☀️"

    Column {
        anchors.centerIn: parent

        width: parent.width

        spacing: units.gu(1)

        Label {
            text: card.city
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            font.pixelSize: 26
        }

        Label {
            text: card.icon
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 40
        }

        Label {
            text: card.temperature
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            font.pixelSize: 30
        }

        Label {
            text: card.condition
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            color: "#cbd5e1"
        }

        Label {
            text: "Humidity: " + card.humidity
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            color: "#94a3b8"
        }
    }
}
