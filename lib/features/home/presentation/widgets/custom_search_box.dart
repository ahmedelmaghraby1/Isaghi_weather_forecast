// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isaghi/core/src/app_exports.dart';

class CustomSearchField extends StatelessWidget {
  final double? height;
  final double? width;
  final TextStyle? hintStyle;
  final String? hintText;
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
        cursorColor: AppColors.blue,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.blue),
                borderRadius: BorderRadius.circular(10.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.blue),
                borderRadius: BorderRadius.circular(10.r)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.blue),
                borderRadius: BorderRadius.circular(10.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.sp, color: AppColors.blue),
                borderRadius: BorderRadius.circular(10.r))),
        validator: validator,
      ),
    );
  }
}
