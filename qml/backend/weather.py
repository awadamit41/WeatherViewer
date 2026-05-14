import requests
API_KEY = "b39252ff407ed52f4f8f21f3a4a86ce0"
def get_weather(city):
    url = (
        f"https://api.openweathermap.org/data/2.5/weather"
        f"?q={city}&appid={API_KEY}&units=metric"
    )
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        return {
            "temp": data["main"]["temp"],
            "humidity": data["main"]["humidity"],
            "condition": data["weather"][0]["main"]
        }
    return {
        "temp": "N/A",
        "humidity": "N/A",
        "condition": "City not found"
    }
