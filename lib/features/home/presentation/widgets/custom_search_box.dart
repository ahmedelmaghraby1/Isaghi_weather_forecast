// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isaghi/core/src/app_exports.dart';

class CustomSearchField extends StatelessWidget {
  final double? height;
  final double? width;
  final int? maxLength;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final String? hintText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CustomSearchField({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.validator,
    this.hintStyle,
    this.hintText,
    this.maxLength,
    this.errorStyle,
    this.controller,
  });
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      child: TextFormField(
        style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            textBaseline: TextBaseline.alphabetic),
        controller: controller,
        maxLength: maxLength,
        cursorColor: AppColors.blue,
        decoration: InputDecoration(
            counterStyle: AppTextStyles.textStyle(color: AppColors.white),
            errorStyle: errorStyle,
            hintText: hintText,
            hintStyle: hintStyle,
            border: InputBorder.none,
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.white),
                borderRadius: BorderRadius.circular(5.r)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.white),
                borderRadius: BorderRadius.circular(5.r)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.white),
                borderRadius: BorderRadius.circular(5.r)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.white),
                borderRadius: BorderRadius.circular(5.r))),
        validator: validator,
      ),
    );
  }
}
