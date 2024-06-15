import 'package:isaghi/core/src/app_exports.dart';

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({
    super.key,
    required this.routeName,
  });

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for {$routeName}'),
      ),
    );
  }
}
