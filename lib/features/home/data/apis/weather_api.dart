import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isaghi/core/constants/end_points.dart';
import 'package:isaghi/core/helpers/dio_helper.dart';

class WeatherApi {
  final BaseDioHelper _baseDioHelper;
  WeatherApi(this._baseDioHelper);
  Future getWeather(String city) async {
    late final DotEnv dotEnv;
    await dotenv.load();
    String apiKey = dotenv.env['API_KEY'] ?? '';
    try {
      final Response response = await _baseDioHelper.get(
          base: EndPoints.baseUrl,
          endPoint: '${EndPoints.currentWeather}${EndPoints.key}$apiKey',
          query: {"q": 'paris'});
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
