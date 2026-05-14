import QtQuick 2.4
import Ubuntu.Components 1.3
import io.thp.pyotherside 1.5
MainView {
    objectName: "mainView"
    width: units.gu(45)
    height: units.gu(75)
    applicationName: "weatherviewer2.com.amit"
    Page {
        header: PageHeader {
            title: "Weather Viewer"
        }
        Python {
            id: py
            Component.onCompleted: {
                addImportPath(Qt.resolvedUrl("./backend"))
                importModule("weather", function () {
                    console.log("Weather module loaded")
                })
            }
            onReceived: function(data) {
                tempLabel.text = "Temperature: " + data.temp + "°C"
                conditionLabel.text = "Condition: " + data.condition
                humidityLabel.text = "Humidity: " + data.humidity + "%"
            }
        }
        Rectangle {
            anchors.fill: parent
            color: "#1e1e2f"
            Column {
                anchors.centerIn: parent
                spacing: units.gu(2)
                TextField {
                    id: cityInput
                    width: units.gu(30)
                    placeholderText: "Enter city"
                }
                Button {
                    text: "Get Weather"
                    onClicked: {
                        py.call("weather.get_weather", [cityInput.text],
                            function(result) {
                                tempLabel.text =
                                    "Temperature: " + result.temp + "°C"
                                conditionLabel.text =
                                    "Condition: " + result.condition
                                humidityLabel.text =
                                    "Humidity: " + result.humidity + "%"
                            }
                        )
                    }
                }
                Label {
                    id: tempLabel
                    text: "Temperature: --"
                    color: "white"
                }
                Label {
                    id: conditionLabel
                    text: "Condition: --"
                    color: "white"
                }
                Label {
                    id: humidityLabel
                    text: "Humidity: --"
                    color: "white"
                }
            }
        }
    }
}
