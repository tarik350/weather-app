// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:weather_app/features/weather/screen/weather_screen.dart' as _i1;

/// generated route for
/// [_i1.WeatherScreen]
class WeatherRoute extends _i2.PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          WeatherRoute.name,
          args: WeatherRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<WeatherRouteArgs>(orElse: () => const WeatherRouteArgs());
      return _i1.WeatherScreen(key: args.key);
    },
  );
}

class WeatherRouteArgs {
  const WeatherRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'WeatherRouteArgs{key: $key}';
  }
}
