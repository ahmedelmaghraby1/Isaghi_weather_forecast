import 'package:isaghi/core/src/app_exports.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key, this.mainAxisAlignment});
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        SizedBox(height: 20.h),
        Text(
          'noCityMatches'.tr(context),
          style: AppTextStyles.textStyle(
            size: 16,
            weight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          "tryAgain".tr(context),
          style: AppTextStyles.textStyle(
            color: AppColors.cA4ACAD,
            size: 14,
            weight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
