import 'package:isaghi/core/helpers/app_validations.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/cubit/home_cubit.dart';
import 'package:isaghi/features/home/presentation/widgets/custom_search_box.dart';

class SearchBox extends StatelessWidget {
  final Color color;
  const SearchBox({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController city,
    required this.color,
  })  : _formKey = formKey,
        _city = city;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _city;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: 15.h, start: 10.w, end: 5.w),
          child: InkWell(
            onTap: () {
              HomeCubit.get(context)
                  .getCityWeather('${position.latitude},${position.latitude}');
            },
            child: const Icon(
              Icons.location_on,
              color: AppColors.white,
              size: 40,
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: CustomSearchField(
            controller: _city,
            maxLength: 20,
            validator: (value) {
              return AppValidations.validateCity(value, context);
            },
            hintStyle: AppTextStyles.textStyle(
                color: HomeCubit.get(context).cityWeatherModel == null
                    ? AppColors.white
                    : HomeCubit.get(context).cityWeatherModel!.current!.isDay ==
                            1
                        ? AppColors.blue
                        : AppColors.white,
                size: 16,
                weight: FontWeight.bold),
            errorStyle: AppTextStyles.textStyle(
              color: HomeCubit.get(context).cityWeatherModel == null
                  ? AppColors.white
                  : HomeCubit.get(context).cityWeatherModel!.current!.isDay == 1
                      ? AppColors.blue
                      : AppColors.white,
              size: 14,
            ),
            hintText: 'searchWithCity'.tr(context),
            height: 50.h,
            width: 240.w,
            margin: EdgeInsetsDirectional.only(end: 0.w, top: 15.h),
          ),
        ),
        IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                HomeCubit.get(context).getCityWeather(_city.text);
              }
            },
            icon: Padding(
              padding: EdgeInsetsDirectional.only(top: 15.h, start: 10.w),
              child: Icon(
                Icons.send,
                color: color,
                size: 40,
              ),
            )),
      ],
    );
  }
}
