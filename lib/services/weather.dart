import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "69ed9058228bb4d1e367a8710ee453b3";

class WeatherModel {

  Future<dynamic> getCityWeather(String typedCity) async{
    String url = "https://api.openweathermap.org/data/2.5/weather?q=$typedCity&appid=$apiKey&units=metric";
    NetworkingHelper networkHelper = NetworkingHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = new Location();
    await location.getCurrentLocation();
    print("Back");

    NetworkingHelper networkHelper = NetworkingHelper("https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    print(condition);
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
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
      return 'That\'s cold.';
    } else {
      return 'Bring a ☔ just in case';
    }
  }
}
