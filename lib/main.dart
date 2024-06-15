import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:isaghi/core/helpers/app_bloc_observer.dart';
import 'package:isaghi/core/helpers/geolocator_helpers.dart';
import 'package:isaghi/core/src/app.dart';
import 'package:isaghi/core/src/app_exports.dart';

void main() async {
  initGetIt();
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  position = await GeoLocatorHelper.determinePosition();
  await dotenv.load(fileName: "api_key.env");
  runApp(const WeatherForecastApp());
}
