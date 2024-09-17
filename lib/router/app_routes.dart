import 'package:go_router/go_router.dart';
import 'package:playground/home/home_screen.dart';
import 'package:playground/main.dart';
import 'package:playground/router/router_config.dart';

final routes = GoRouter(
  initialLocation: RouterConfig.first,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouterConfig.first,
      name: AppRoute.first.name,
      builder: (context, state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: RouterConfig.home,
      name: AppRoute.home.name,
      builder: (context, state) {
        final page = state.uri.queryParameters['page'];
        final parsedPage = TabItems.values.firstWhere(
          (element) => element.name == page,
        );
        return HomeScreen(
          initialPage: parsedPage,
        );
      },
    ),
  ],
);
