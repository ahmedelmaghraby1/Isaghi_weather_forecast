import 'package:isaghi/core/src/app_exports.dart';

class NoLocationAccessability extends StatelessWidget {
  const NoLocationAccessability({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'We don\'t have access for your current location but you can search with city\'s name',
      style: AppTextStyles.textStyle(
          size: 16, weight: FontWeight.w600, color: AppColors.red),
    );
  }
}
