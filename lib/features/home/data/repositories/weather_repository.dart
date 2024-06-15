import 'package:isaghi/features/home/data/apis/weather_api.dart';
import 'package:isaghi/features/home/data/models/weather_model.dart';

class WeatherRepository {
  final WeatherApi _weatherApi;
  WeatherRepository(this._weatherApi);
  Future getCityWeather(String city) async {
    final dynamic response = await _weatherApi.getWeather(city);
    if (response == false) {
      return false;
    } else {
      try {
        WeatherForecastModel weatherForecastModel =
            WeatherForecastModel.fromJson(response);

        return weatherForecastModel;
      } catch (e) {
        print(e.toString());

        return false;
      }
    }
  }
}
