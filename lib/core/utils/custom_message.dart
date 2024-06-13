import 'package:isaghi/core/constants/image_constants.dart';
import 'package:isaghi/core/src/app_exports.dart';

enum AlertType {
  success,
  failed,
  warning,
  information,
}

class CustomMessage {
  static showMessage(BuildContext context,
      {required String message,
      required AlertType type,
      double? height,
      double? width,
      String? title,
      bool? showCloseIcon,
      Duration? duration}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      closeIconColor: type == AlertType.success
          ? AppColors.green
          : type == AlertType.failed
              ? AppColors.red
              : type == AlertType.warning
                  ? AppColors.lightOrange
                  : AppColors.blue,
      showCloseIcon: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5.r),
          side: BorderSide(width: 1.sp, color: AppColors.grey)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsetsDirectional.only(bottom: 65.h, start: 25.w, end: 25.w),
      padding: EdgeInsetsDirectional.only(
          top: 5.h, bottom: 10.h, start: 10.w, end: 0.w),
      duration: duration ?? const Duration(seconds: 4),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 7.w),
            child: type == AlertType.information
                ? Image.asset(
                    ImageConstants.informationImg,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.scaleDown,
                  )
                : type == AlertType.success
                    ? Image.asset(ImageConstants.greencheckImg,
                        width: 50.w, height: 50.h, fit: BoxFit.scaleDown)
                    : type == AlertType.failed
                        ? Image.asset(ImageConstants.redcloseImg,
                            width: 50.w, height: 50.h, fit: BoxFit.scaleDown)
                        : Image.asset(ImageConstants.alertImg,
                            width: 42.w, height: 42.h, fit: BoxFit.scaleDown),
          ),
          SizedBox(
            width: 200.w,
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.textStyle(
                color: AppColors.c888888,
                size: 14,
                weight: FontWeight.w900,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 5.w),
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.cA4ACAD,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
    ));
  }
}
