import 'package:isaghi/core/common/widgets/no_internet.dart';
import 'package:isaghi/core/common/widgets/no_route.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/cubit/home_cubit.dart';
import 'package:isaghi/features/home/presentation/screens/home_screen.dart';
import 'package:isaghi/features/internet/cubit/state.dart';

part 'app_routes.dart';

class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is ConnectedState) {
              switch (settings.name) {
                case AppRoutes.homeScreen:
                  return BlocProvider<HomeCubit>(
                    create: (context) => getIt<HomeCubit>(),
                    child: const HomeScreen(),
                  );
                default:
                  return const NoRouteScreen(
                    routeName: '',
                  );
              }
            } else if (state is NotConnectedState) {
              return const NoInternet();
            } else {
              return const NoInternet();
            }
          },
        );
      },
    );
  }
}
