import 'package:isaghi/core/constants/image_constants.dart';
import 'package:isaghi/core/localization/app_localization.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/core/themes/styles.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key, this.mainAxisAlignment});

  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.noInternet),
            const SizedBox(height: 20),
            Text(
              "noInternetHeader".tr(context),
              style: AppTextStyles.textStyle(
                // color: AppColors.c00243C,
                size: 16,
                weight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "noInternetBody".tr(context),
              style: AppTextStyles.textStyle(
                color: AppColors.cA4ACAD,
                size: 14,
                weight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                // // Check for internet connectivity
                // var connectivityResult =
                //     await Connectivity().checkConnectivity();
                // if (connectivityResult == ConnectivityResult.none) {
                //   CustomMessage.showMessage(context,
                //       message: "noInternet".tr(context),
                //       type: AlertType.information);
                // } else {
                //   print("Internet is available.");
                // }
              },
              child: Container(
                width: 111.w,
                height: 30.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      // AppColors.cFFCD4D,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cF1B44F.withOpacity(0.35),
                      blurRadius: 16.r,
                      offset: Offset(0, 8.h),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "retry".tr(context),
                  style: AppTextStyles.textStyle(
                    size: 14,
                    weight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
