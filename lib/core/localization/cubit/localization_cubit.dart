import 'package:isaghi/core/injection/injector.dart';
import 'package:isaghi/core/localization/app_localization.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_state.dart';

class LocalizationBloc extends Cubit<LocalizationState> {
  LocalizationBloc() : super(LocalizationInit());
  int lang = 0;

  static LocalizationBloc get(context) =>
      BlocProvider.of<LocalizationBloc>(context);

  void changeLanguageToArabic() {
    lang = 0;
    getIt<SharedPreferences>()
        .setString("locale", AppLocalization.supportedLocales.first.toString());
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales.first,
      ),
    );
  }

  void changeLanguageToEnglish() {
    lang = 1;
    getIt<SharedPreferences>()
        .setString("locale", AppLocalization.supportedLocales.last.toString());
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales.last,
      ),
    );
  }
}
