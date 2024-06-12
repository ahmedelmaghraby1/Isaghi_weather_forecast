import 'package:get_it/get_it.dart';
import 'package:isaghi/features/internet/cubit/cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<InternetCubit>(() => InternetCubit());
}
