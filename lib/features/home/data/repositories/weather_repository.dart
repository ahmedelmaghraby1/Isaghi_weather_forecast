import 'package:isaghi/features/home/data/apis/weather_api.dart';

class WeatherRepository {
  final WeatherApi _weatherApi;
  WeatherRepository(this._weatherApi);
  Future getWeather(String city) async {
    final dynamic response = await _weatherApi.getWeather(city);
  }
}
