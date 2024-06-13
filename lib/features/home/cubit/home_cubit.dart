// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:isaghi/features/home/data/repositories/weather_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WeatherRepository _weatherRepository;
  HomeCubit(
    this._weatherRepository,
  ) : super(HomeInitial());
  Future getWeather(String city) async {
    await _weatherRepository.getWeather(city);
  }
}
