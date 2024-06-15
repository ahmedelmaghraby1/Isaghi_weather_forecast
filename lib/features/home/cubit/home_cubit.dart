// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/data/models/weather_model.dart';

import 'package:isaghi/features/home/data/repositories/weather_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WeatherRepository _weatherRepository;
  HomeCubit(
    this._weatherRepository,
  ) : super(HomeInitial());
  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);
  WeatherForecastModel? cityWeatherModel;
  WeatherForecastModel? currentLocationModel;
  Future getCurrentLocationWeather(String city) async {
    emit(CurrentLocationWeatherLoading());
    final response = await _weatherRepository.getCityWeather(city);
    if (response == false) {
      emit(CurrentLocationWeatherLoadingFailed());
    } else {
      currentLocationModel = response;
      emit(CurrentLocationWeatherLoadedSuccessfully());
    }
  }

  Future getCityWeather(String city) async {
    emit(WeatherLoading());
    final response = await _weatherRepository.getCityWeather(city);
    if (response == false) {
      emit(WeatherLoadingFailed());
    } else {
      emit(WeatherLoadedSuccessfully());
    }
  }
}
