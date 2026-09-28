# 🌦️ WeatherViewer

> A modern Ubuntu Touch weather dashboard built with **QML + Python**, powered by live weather data.

**WeatherViewer** is a small open-source application created to explore how a mobile-style Linux application can combine a responsive QML interface, Python business logic, and a real web API.

The user enters a city, WeatherViewer contacts the OpenWeather API, and the current weather information is presented through a clean, animated dashboard.

---

## ✨ What This Project Demonstrates

WeatherViewer is intentionally small, but it covers several real software-development concepts in one project:

- Building a mobile-style UI with **QML**
- Integrating **Python** with QML through **PyOtherSide**
- Consuming a **REST API**
- Parsing JSON weather responses
- Updating UI state asynchronously
- Creating reusable QML components
- Building an Ubuntu Touch application with **Clickable**
- Developing and testing inside a Linux virtual machine
- Managing source code and releases with **Git + GitHub**

Think of the architecture as:

```text
┌─────────────────────────────┐
│       QML Interface         │
│  Search • Button • Cards    │
└──────────────┬──────────────┘
               │
               │ PyOtherSide
               ▼
┌─────────────────────────────┐
│       Python Backend        │
│     weather.py              │
└──────────────┬──────────────┘
               │
               │ HTTPS / JSON
               ▼
┌─────────────────────────────┐
│       OpenWeather API       │
│      Live weather data      │
└─────────────────────────────┘
```

---

# 🚀 Features

### Current Weather

Search for a city and retrieve live:

- 🌡️ Temperature
- ☁️ Weather condition
- 💧 Humidity

### Dynamic Weather Presentation

The dashboard changes its weather symbol according to the returned condition:

| Condition | Display |
|---|---|
| Clear | ☀️ |
| Clouds | ☁️ |
| Rain | 🌧️ |
| Thunderstorm | ⛈️ |
| Snow | ❄️ |
| Other | 🌍 |

### Interactive UI

- Centered mobile-style dashboard
- Gradient background
- Rounded weather card
- Search field
- Animated button interaction
- Loading indicator
- Reusable QML component structure

---

# 🧰 Technology Stack

| Layer | Technology |
|---|---|
| UI | QML / QtQuick |
| Application Toolkit | Ubuntu Components |
| Backend | Python |
| QML ↔ Python | PyOtherSide |
| Weather Data | OpenWeather API |
| Build System | CMake |
| Ubuntu Touch Packaging | Clickable |
| Development | VS Code |
| Version Control | Git + GitHub |
| Platform | Ubuntu Touch / Lomiri ecosystem |
| Development Environment | Ubuntu Linux + VirtualBox |

---

# 📁 Project Structure

```text
WeatherViewer/
│
├── assets/
│   └── logo.svg
│
├── qml/
│   ├── Main.qml
│   │
│   ├── backend/
│   │   ├── __init__.py
│   │   └── weather.py
│   │
│   └── components/
│       ├── WeatherCard.qml
│       └── ForecastCard.qml
│
├── src/
│   └── example.py
│
├── po/
│   ├── CMakeLists.txt
│   └── weatherviewer2.com.amit.pot
│
├── clickable.yaml
├── CMakeLists.txt
├── manifest.json.in
├── weatherviewer2.apparmor
├── weatherviewer2.desktop.in
├── snapcraft.yaml
├── LICENSE
└── README.md
```

### Important files

**`qml/Main.qml`**  
The main application screen and QML event handling.

**`qml/backend/weather.py`**  
The Python layer that calls OpenWeather and returns the weather information to QML.

**`qml/components/WeatherCard.qml`**  
A reusable UI component responsible for presenting current weather information.

**`clickable.yaml`**  
Clickable build configuration.

**`CMakeLists.txt`**  
Defines what gets installed into the application package.

**`manifest.json.in`**  
Application metadata and Ubuntu Touch package configuration.

---

# 🔄 How the Application Works

## Step 1 — User enters a city

Example:

```text
Pune
```

## Step 2 — User presses `Get Weather`

QML calls the Python function:

```text
weather.get_weather(city)
```

## Step 3 — Python contacts OpenWeather

The backend sends an HTTPS request to the OpenWeather current-weather endpoint.

## Step 4 — API returns JSON

Python extracts:

```text
temperature
humidity
weather condition
```

## Step 5 — Python returns the result

PyOtherSide passes the result back to QML.

## Step 6 — QML updates the interface

The WeatherCard receives the new values and updates the screen.

---

# 🛠️ Getting Started

The following workflow assumes an Ubuntu development machine or Ubuntu VM.

## 1. Install Git

```bash
sudo apt update
sudo apt install git -y
```

Check:

```bash
git --version
```

---

## 2. Install Python tooling

```bash
sudo apt install python3 python3-pip python3-venv -y
```

---

## 3. Create a virtual environment

From your development home directory:

```bash
python3 -m venv clickable-env
```

Activate it:

```bash
source ~/clickable-env/bin/activate
```

Your shell should now show:

```text
(clickable-env)
```

---

## 4. Install Clickable

```bash
pip install clickable-ut
```

Verify:

```bash
clickable --version
```

---

## 5. Install desktop dependencies

For the development environment:

```bash
sudo apt install \
    qtcreator \
    qtbase5-dev \
    qtdeclarative5-dev \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-layouts \
    qmlscene \
    qml-module-io-thp-pyotherside \
    build-essential \
    cmake \
    git \
    python3-pip \
    -y
```

> Package availability can vary between Ubuntu releases. The application itself uses Clickable/CMake packaging, while these packages provide the local development environment.

---

# 🔑 OpenWeather API Setup

WeatherViewer uses the OpenWeather API.

Create an account and generate an API key from:

**https://openweathermap.org/api**

Then configure the key for your local development environment.

### ⚠️ Security warning

**Never commit a real API key to GitHub.**

Before publishing this repository, make sure:

- the API key is removed from source code
- the exposed key is revoked/rotated in your OpenWeather account
- only a placeholder is committed

Example:

```python
API_KEY = "YOUR_OPENWEATHER_API_KEY"
```

For a production-ready version, move secrets out of the source code and inject them through a secure configuration mechanism.

---

# ▶️ Running the Project

From the project root:

```bash
source ~/clickable-env/bin/activate
```

Then:

```bash
clickable build
```

Launch the desktop test environment:

```bash
clickable desktop
```

The application should open in a desktop window using the Ubuntu Touch/Lomiri-style UI.

---

# 🧪 Testing the Application

Try several inputs.

### Valid city

```text
Pune
```

Expected:
- temperature displayed
- condition displayed
- humidity displayed
- corresponding weather icon displayed

### Another city

```text
Mumbai
```

Verify the values change.

### Invalid city

```text
xyzabc123
```

The application should return an error state rather than crashing.

---

# 🧠 What You Can Learn From This Project

WeatherViewer is useful as a learning project because each part maps to a practical development concept.

### QML

Learn:

- declarative UI
- layouts
- properties
- signals
- event handling
- reusable components
- animations

### Python

Learn:

- functions
- HTTP requests
- JSON parsing
- error handling
- returning structured data

### APIs

Learn:

- REST endpoints
- query parameters
- HTTP status codes
- JSON responses
- API authentication

### PyOtherSide

Learn how a QML application can communicate with Python code.

### Clickable

Learn:

- Ubuntu Touch project structure
- application packaging
- build commands
- desktop testing
- Click packaging workflow

### Git

Learn an incremental workflow:

```bash
git status
git add .
git commit -m "Describe the change"
git push
```

---

# 🧭 Suggested Development Workflow

A simple development cycle for this project is:

```text
1. Change code
       ↓
2. Build
       ↓
3. Run
       ↓
4. Test
       ↓
5. Commit
       ↓
6. Push
```

Example:

```bash
clickable build
clickable desktop

git status
git add .
git commit -m "Improve weather card layout"
git push
```

Keeping commits small makes it easier to understand how the application evolved.

---

# 📸 Screenshots

Add screenshots of the finished application here.

Suggested files:

```text
docs/
└── screenshots/
    └── weather-dashboard.png
```

Then add:

```markdown
![WeatherViewer dashboard](docs/screenshots/weather-dashboard.png)
```

---

# 🧩 Current Scope

The current release intentionally focuses on **current weather** rather than trying to become a full weather platform.

Implemented:

- Current weather lookup
- City search
- Temperature
- Condition
- Humidity
- Dynamic weather icon
- Loading state
- Reusable WeatherCard
- Ubuntu Touch packaging
- GitHub-based development workflow

A `ForecastCard` component is present in the project as groundwork for future experimentation, but forecast functionality is not part of the current release.

---

# 🐛 Troubleshooting

## `clickable: command not found`

Activate the virtual environment:

```bash
source ~/clickable-env/bin/activate
```

Then verify:

```bash
clickable --version
```

---

## `WeatherCard is not a type`

Make sure the component import exists in `Main.qml`:

```qml
import "components"
```

and that the file exists:

```text
qml/components/WeatherCard.qml
```

---

## Python module cannot be imported

Check:

```text
qml/backend/weather.py
```

and make sure the QML Python bridge loads the module from:

```qml
Qt.resolvedUrl("./backend")
```

---

## API returns no useful data

Check:

1. Internet connection
2. City spelling
3. OpenWeather API key
4. API key activation status
5. HTTP response status

---

# 🌱 Possible Future Directions

This release is deliberately small. Natural next experiments include:

- multi-day forecast
- hourly forecast
- weather history
- temperature visualization
- city comparison
- AQI integration
- location-based weather
- local favorites
- offline caching

These are intentionally outside the scope of the current release.

---

# 🤝 Contributing

Contributions are welcome.

A simple contribution workflow:

```bash
git clone <repository-url>
cd WeatherViewer

git checkout -b feature/my-change

# Make your changes

git add .
git commit -m "Describe my change"
git push origin feature/my-change
```

Then open a pull request on GitHub.

---

# 📄 License

WeatherViewer is released under the **GNU General Public License v3.0 (GPL-3.0)**.

See [`LICENSE`](LICENSE) for the full license text.

---

# 👨‍💻 Author

**Amit Awad**

Built as an open-source learning project exploring:

> **QML + Python + APIs + Ubuntu Touch**

---

# ⭐ Project Goal

WeatherViewer started as a small question:

> **“How can a lightweight Linux mobile application turn a city name into useful information?”**

The answer became a practical exercise in:

**UI → Backend → API → Data → UI**

That's the core lesson of this project.

---

## GitHub

**Repository:**  
https://github.com/awadamit41/WeatherViewer

---

**WeatherViewer v1.0.0**  
Built with curiosity, QML, Python, and open-source tools. 🌦️
