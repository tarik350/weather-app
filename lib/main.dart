import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/routes/routes.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/features/weather/cubit/weather_cubit.dart';
import 'package:weather_app/services/init_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await initService();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('am', 'ET')],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  final _appRouter = AppRouter();
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => WeatherRepository()),
      ],
      child: BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        child: MaterialApp(
          key: UniqueKey(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: const [Locale('en', 'US'), Locale('am', 'ET')],
          locale: context.locale,
          theme: ThemeData(fontFamily: "Mulish"),
          home: ScreenUtilInit(
              designSize: const Size(360, 800),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                  routerConfig: _appRouter.config(),
                  debugShowCheckedModeBanner: false,
                );
              }),
        ),
      ),
    );
  }
}
