import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isaghi/features/internet/cubit/cubit.dart';
import 'package:isaghi/main.dart';

class WeatherForecastApp extends StatelessWidget {
  const WeatherForecastApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(create: (context) => InternetCubit()),
        ],
        child: MyApp(),
      ),
    );
  }
}
