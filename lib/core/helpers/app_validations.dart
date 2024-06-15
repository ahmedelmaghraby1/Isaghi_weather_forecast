import 'package:isaghi/core/src/app_exports.dart';

class AppValidations {
  static String? validateCity(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'cantBeEmpty'.tr(context);
    } else {
      return null;
    }
  }
}
