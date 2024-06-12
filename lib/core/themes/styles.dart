import 'package:isaghi/core/src/app_exports.dart';

class AppTextStyles {
  static TextStyle textStyle({
    Color? color,
    Color? decorationColor,
    double? size,
    String? family,
    FontWeight? weight,
    TextDecoration? decoration,
    List<Shadow>? shadow,
    double height = 1.3,
    bool? isItalic = false,
  }) {
    return TextStyle(
      inherit: false,
      color: color ?? AppColors.black,
      fontSize: (size ?? 14).sp,
      fontFamily: family ?? 'Helvetica',
      fontWeight: weight ?? FontWeight.w400,
      height: height,
      fontStyle: isItalic! ? FontStyle.italic : null,
      decoration: decoration,
      shadows: shadow,
      decorationColor: decorationColor,
    );
  }
}
