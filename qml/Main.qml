import QtQuick 2.4
import Ubuntu.Components 1.3
import io.thp.pyotherside 1.5
import "components"
MainView {
    id: mainView
    objectName: "mainView"
    width: units.gu(45)
    height: units.gu(75)
    applicationName: "weatherviewer2.com.amit"
    property bool loading: false
    Page {
        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#0f172a"
                }
                GradientStop {
                    position: 1.0
                    color: "#1e293b"
                }
            }
            Python {
                id: py
                Component.onCompleted: {
                    addImportPath(
                        Qt.resolvedUrl("./backend")
                    )
                    importModule(
                        "weather",
                        function () {
                            console.log(
                                "Weather module loaded"
                            )
                        }
                    )
                }
            }
            Column {
                anchors.centerIn: parent
                spacing: units.gu(3)
                TextField {
                    id: cityInput
                    width: units.gu(30)
                    placeholderText: "Enter city"
                    color: "black"
                    Rectangle {
                        anchors.fill: parent
                        radius: units.gu(1)
                        color: "white"
                        z: -1
                    }
                }
                Button {
                    id: weatherButton
                    text: "Get Weather"
                    anchors.horizontalCenter:
                        parent.horizontalCenter
                    scale: pressed ? 0.95 : 1.0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 120
                        }
                    }
                    onClicked: {
                        loading = true
                        py.call(
                            "weather.get_weather",
                            [cityInput.text],
                            function(result) {
                                loading = false
                                weatherCard.city =
                                    cityInput.text
                                weatherCard.temperature =
                                    result.temp + "°C"
                                weatherCard.condition =
                                    result.condition
                                weatherCard.humidity =
                                    result.humidity + "%"
                                if (
                                    result.condition ===
                                    "Clouds"
                                ) {
                                    weatherCard.icon =
                                        "☁️"
                                } else if (
                                    result.condition ===
                                    "Rain"
                                ) {
                                    weatherCard.icon =
                                        "🌧️"
                                } else if (
                                    result.condition ===
                                    "Clear"
                                ) {
                                    weatherCard.icon =
                                        "☀️"
                                } else if (
                                    result.condition ===
                                    "Thunderstorm"
                                ) {
                                    weatherCard.icon =
                                        "⛈️"
                                } else if (
                                    result.condition ===
                                    "Snow"
                                ) {
                                    weatherCard.icon =
                                        "❄️"
                                } else {
                                    weatherCard.icon =
                                        "🌍"
                                }
                            }
                        )
                    }
                }
                ActivityIndicator {
                    running: loading
                    visible: loading
                    anchors.horizontalCenter:
                        parent.horizontalCenter
                }
                WeatherCard {
                    id: weatherCard
                }
            }
        }
    }
}
