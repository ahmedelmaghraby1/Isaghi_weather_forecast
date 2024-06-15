part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class WeatherLoading extends HomeState {}

final class WeatherLoadedSuccessfully extends HomeState {}

final class WeatherLoadingFailed extends HomeState {}

final class CurrentLocationWeatherLoading extends HomeState {}

final class CurrentLocationWeatherLoadedSuccessfully extends HomeState {}

final class CurrentLocationWeatherLoadingFailed extends HomeState {}
