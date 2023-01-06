import 'package:counter_cubit/src/features/bottom/presentation/views/bottom_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final routesApp = Routes();

class Routes {
  static const String home = '/';

  final routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) => const CupertinoPage(
          child: BottomView(),
        ),
      ),
    ],
  );
}
