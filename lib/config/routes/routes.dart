import 'package:auto_route/auto_route.dart';
import 'package:weather_app/config/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: WeatherRoute.page, initial: true)];
}
