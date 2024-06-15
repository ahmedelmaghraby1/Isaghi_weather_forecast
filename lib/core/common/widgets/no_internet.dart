import 'package:isaghi/core/src/app_exports.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'noInternet'.tr(context),
          style: AppTextStyles.textStyle(size: 26),
        ),
      ),
    );
  }
}
