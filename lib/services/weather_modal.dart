import 'package:weather1_app/services/location.dart';
import 'package:weather1_app/services/networking.dart';

class WeatherModal {
  static const apiKey = "d1d475bf92b097e226cb61adbecca807";
  static const openweathermapURL =
      "https://api.openweathermap.org/data/2.5/weather";

  Future<dynamic> cityWeather(String cityName) async {
    var url = "$openweathermapURL?q=$cityName&appid=$apiKey&units=metric";

    Networking networking = Networking(url);
    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getLocatoinWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking("$openweathermapURL?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric");

    var weatherData = await networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
