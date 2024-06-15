import 'package:isaghi/core/constants/image_constants.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _city;
  @override
  void initState() {
    _city = TextEditingController();
    HomeCubit.get(context)
        .getCurrentLocationWeather('${position.latitude},${position.latitude}');
    super.initState();
  }

  @override
  void dispose() {
    _city.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) =>
            state is CurrentLocationWeatherLoadedSuccessfully
                ? Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            HomeCubit.get(context)
                                        .currentLocationModel!
                                        .current!
                                        .isDay ==
                                    0
                                ? ImageConstants.night
                                : ImageConstants.day,
                          ),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(HomeCubit.get(context)
                          .currentLocationModel!
                          .current!
                          .tempC!
                          .toString()),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
// import 'package:isaghi/core/src/app_exports.dart';
// import 'package:isaghi/features/home/cubit/home_cubit.dart';
// import 'package:isaghi/features/home/presentation/widgets/custom_search_box.dart';
// import 'package:isaghi/features/home/presentation/widgets/no_location_access.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late TextEditingController _city;
//   @override
//   void initState() {
//     _city = TextEditingController();
//     HomeCubit.get(context)
//         .getCurrentLocationWeather('${position.latitude},${position.latitude}');
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _city.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(70),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10)),
//           child: AppBar(
//             actions: [
//               Padding(
//                 padding: EdgeInsetsDirectional.only(end: 15.w),
//                 child: GestureDetector(
//                   onTap: () {
//                     if (getIt<SharedPreferences>().getString("locale") ==
//                         null) {
//                       LocalizationBloc.get(context).changeLanguageToEnglish();
//                     } else if (getIt<SharedPreferences>().getString("locale") ==
//                         'ar') {
//                       LocalizationBloc.get(context).changeLanguageToEnglish();
//                     } else {
//                       LocalizationBloc.get(context).changeLanguageToArabic();
//                     }
//                   },
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.only(top: 2.w, end: 5.w),
//                         child: Text(
//                           'language'.tr(context),
//                           style: AppTextStyles.textStyle(
//                             color: AppColors.white,
//                             size: 16,
//                           ),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.language,
//                         color: AppColors.white,
//                         size: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//             backgroundColor: AppColors.blue,
//             title: Text('appBarTitle'.tr(context),
//                 style:
//                     AppTextStyles.textStyle(color: AppColors.white, size: 22)),
//             // centerTitle: true,
//           ),
//         ),
//       ),
//       backgroundColor: AppColors.white,
//       body: Form(
//           child: Column(
//         children: [
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {},
//                   icon: Padding(
//                     padding: EdgeInsetsDirectional.only(top: 15.h),
//                     child: const Icon(
//                       Icons.location_on,
//                       color: AppColors.green,
//                       size: 40,
//                     ),
//                   )),
//               CustomSearchField(
//                 hintText: 'searchByCity'.tr(context),
//                 height: 50.h,
//                 width: 240.w,
//                 margin: EdgeInsetsDirectional.only(end: 0.w, top: 15.h),
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon: Padding(
//                     padding: EdgeInsetsDirectional.only(top: 15.h, start: 10.w),
//                     child: const Icon(
//                       Icons.send,
//                       color: AppColors.blue,
//                       size: 40,
//                     ),
//                   )),
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//                   child: const NoLocationAccessability()),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//                 child: Text(
//                   'Weather details for your current location',
//                   style: AppTextStyles.textStyle(size: 18),
//                 ),
//               ),
//             ],
//           )
//         ],
//       )),
//     );
//   }
// }
