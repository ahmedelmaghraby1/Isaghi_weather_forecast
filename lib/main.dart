import 'package:isaghi/core/src/app.dart';
import 'package:isaghi/core/src/app_exports.dart';

void main() {
  initGetIt();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WeatherForecastApp());
}
