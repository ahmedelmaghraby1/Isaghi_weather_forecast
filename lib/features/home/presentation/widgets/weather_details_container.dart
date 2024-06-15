import 'package:isaghi/core/helpers/date_time_formatters.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/cubit/home_cubit.dart';

class WeatherDetailsContainer extends StatelessWidget {
  final Color color;
  const WeatherDetailsContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                '${HomeCubit.get(context).cityWeatherModel!.location?.country}, ',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.textStyle(size: 26, color: color),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  '${HomeCubit.get(context).cityWeatherModel!.location?.name} ',
                  style: AppTextStyles.textStyle(size: 16, color: color),
                ),
              ),
            ),
          ],
        ),
        Text(
          '${HomeCubit.get(context).cityWeatherModel!.current!.tempC!.toString()} °',
          style: AppTextStyles.textStyle(size: 50, color: color),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                '${HomeCubit.get(context).cityWeatherModel!.current!.condition!.text.toString()} ',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.textStyle(size: 30, color: color),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Image.network(
                  'https:${HomeCubit.get(context).cityWeatherModel!.current!.condition!.icon}'),
            )
          ],
        ),
        Text(
          DateTimeFormatters.dateParsing(
              HomeCubit.get(context).cityWeatherModel!.location!.localtime!),
          style: AppTextStyles.textStyle(size: 24, color: color),
        ),
      ],
    );
  }
}
