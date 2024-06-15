import 'package:isaghi/core/common/widgets/no_result.dart';
import 'package:isaghi/core/constants/image_constants.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/cubit/home_cubit.dart';
import 'package:isaghi/features/home/presentation/widgets/search_box.dart';
import 'package:isaghi/features/home/presentation/widgets/weather_details_container.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _city;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _city = TextEditingController();
    _formKey = GlobalKey<FormState>();
    HomeCubit.get(context)
        .getCityWeather('${position.latitude},${position.latitude}');
    super.initState();
  }

  @override
  void dispose() {
    _city.dispose();
    _formKey = GlobalKey<FormState>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          HomeCubit.get(context).cityWeatherModel == null
                              ? ImageConstants.weather
                              : HomeCubit.get(context)
                                          .cityWeatherModel!
                                          .current!
                                          .isDay ==
                                      0
                                  ? ImageConstants.night
                                  : ImageConstants.day,
                        ),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 15.w),
                      child: GestureDetector(
                        onTap: () {
                          if (getIt<SharedPreferences>().getString("locale") ==
                              null) {
                            LocalizationBloc.get(context)
                                .changeLanguageToEnglish();
                          } else if (getIt<SharedPreferences>()
                                  .getString("locale") ==
                              'ar') {
                            LocalizationBloc.get(context)
                                .changeLanguageToEnglish();
                          } else {
                            LocalizationBloc.get(context)
                                .changeLanguageToArabic();
                          }
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 15.w, top: 2.w, end: 5.w),
                              child: Text(
                                'language'.tr(context),
                                style: AppTextStyles.textStyle(
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.language,
                              color: AppColors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    SearchBox(
                      formKey: _formKey,
                      city: _city,
                      color: HomeCubit.get(context).cityWeatherModel == null
                          ? AppColors.white
                          : HomeCubit.get(context)
                                      .cityWeatherModel!
                                      .current!
                                      .isDay ==
                                  1
                              ? AppColors.blue
                              : AppColors.white,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state is WeatherLoadedSuccessfully
                              ? WeatherDetailsContainer(
                                  color: HomeCubit.get(context)
                                              .cityWeatherModel!
                                              .current!
                                              .isDay ==
                                          0
                                      ? AppColors.black
                                      : AppColors.white,
                                )
                              : state is WeatherLoading
                                  ? Center(
                                      child: Lottie.asset(
                                        ImageConstants.loading,
                                        animate: true,
                                      ),
                                    )
                                  : const NoResult()
                        ],
                      ),
                    )
                  ]),
                )),
      ),
    );
  }
}
