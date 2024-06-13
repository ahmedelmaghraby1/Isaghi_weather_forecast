import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/data/apis/weather_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getIt<WeatherApi>().getWeather('city');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: AppBar(
            backgroundColor: AppColors.grey,
            title: Text('appBarTitle'.tr(context),
                style:
                    AppTextStyles.textStyle(color: AppColors.white, size: 22)),
            // centerTitle: true,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}
