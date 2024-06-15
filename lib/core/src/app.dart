import 'package:isaghi/core/src/app_exports.dart';

class WeatherForecastApp extends StatelessWidget {
  const WeatherForecastApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationBloc>(
              create: (context) => getIt<LocalizationBloc>()),
          BlocProvider<InternetCubit>(
              create: (context) => getIt<InternetCubit>()),
        ],
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
          buildWhen: (previous, current) => previous != current,
          builder: (_, localeState) {
            return MaterialApp(
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1)),
                    child: child!);
              },
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalization.supportedLocales,
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              locale: getIt<SharedPreferences>().getString("locale") == null
                  ? localeState.locale
                  : Locale(getIt<SharedPreferences>().getString("locale")!),
              title: 'Weather forecast app',
              restorationScopeId: 'app',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              initialRoute: AppRoutes.homeScreen,
              onGenerateRoute: AppRouter.generateRoutes,
            );
          },
        ),
      ),
    );
  }
}
