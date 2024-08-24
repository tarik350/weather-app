import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart'; // Import easy_localization
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/config/constants/app_colors.dart';
import 'package:weather_app/config/constants/app_images.dart';
import 'package:weather_app/features/weather/cubit/weather_cubit.dart';
import 'package:weather_app/services/init_services.dart';
import 'package:weather_app/services/setting_services.dart';
import 'package:weather_app/services/storage_service.dart';
import 'package:weather_app/utils/dialogue/select_language_dialogue.dart';
import 'package:weather_app/utils/widgets/custome_button.dart';
import 'package:weather_app/utils/widgets/custome_text_field.dart';
import 'package:weather_app/utils/widgets/weather_shimmer.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  final cityController = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherCubit>().fetchWeather('Addis Ababa');

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'app_title'.tr(),
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp),
              ),
            ),
            IconButton(
                onPressed: () async {
                  String? selectedLanguage = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return const LanguageSelectionDialog();
                    },
                  );

                  if (selectedLanguage != null) {
                    // print('Selected Language: $selectedLanguage');

                    if (context.mounted) {
                      if (selectedLanguage.toLowerCase() == "amharic") {
                        context.setLocale(const Locale('am', 'ET'));
                      } else {
                        context.setLocale(const Locale('en', 'US'));
                      }
                    }
                  }
                },
                icon: const Icon(
                  Icons.language,
                  color: AppColors.primaryColor,
                  size: 28,
                ))
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        backgroundColor: AppColors.primaryColor,
        onTap: () async {
          final storageService = getIt<StorageService>();
          bool success = await storageService.clearWeatherBox();

          if (success) {
            Fluttertoast.showToast(
              msg: "cache_cleared".tr(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            Fluttertoast.showToast(
              msg: "cache_clear_error".tr(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        lable: "clear_cache_button".tr(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 53.h, // Set a fixed height for both
                        child: CustomTextfield(
                          controller: cityController,
                          hintText: "enter_city_hint".tr(),
                          onChanged: (value) {},
                          keyString: "city_input_field",
                          inputType: TextInputType.text,
                          errorText: null,
                          onFieldSubmitted: (value) {
                            // Added this line
                            context
                                .read<WeatherCubit>()
                                .fetchWeather(cityController.text);
                          },
                        ),
                      ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(splashFactory: NoSplash.splashFactory),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      icon: Container(
                        height: 53.h,
                        width: 53.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              width: 1, color: AppColors.primaryColor),
                        ),
                        child: const Icon(Icons.search),
                      ),
                      onPressed: () {
                        context
                            .read<WeatherCubit>()
                            .fetchWeather(cityController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.h),
                child: BlocConsumer<WeatherCubit, WeatherState>(
                  listener: (context, state) {
                    // Optionally handle side effects here
                  },
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const WeatherShimmer();
                    } else if (state is WeatherLoaded) {
                      final weather = state.weatherResponse;
                      final String imageUrl =
                          '${getIt<SettingServices>().config.iamgeBaseURL}${weather.weather[0].icon}.png';
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100.w,
                              height: 100.h,
                              child: CachedNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: SizedBox(
                                    width: 100.0.w,
                                    height: 100.0.h,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AppImages.weatherImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              weather.name,
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${weather.main.temp}°C',
                              style: const TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              weather.weather[0].description,
                              style: const TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 20.h),
                            _buildWeatherDetailCard(
                              context,
                              'feels_like'.tr(),
                              '${weather.main.feelsLike}°C',
                            ),
                            _buildWeatherDetailCard(
                              context,
                              'min_temperature'.tr(),
                              '${weather.main.tempMin}°C',
                            ),
                            _buildWeatherDetailCard(
                              context,
                              'max_temperature'.tr(),
                              '${weather.main.tempMax}°C',
                            ),
                            _buildWeatherDetailCard(
                              context,
                              'pressure'.tr(),
                              '${weather.main.pressure} hPa',
                            ),
                            _buildWeatherDetailCard(
                              context,
                              'humidity'.tr(),
                              '${weather.main.humidity}%',
                            ),
                          ],
                        ),
                      );
                    } else if (state is WeatherError) {
                      return Center(
                        child: Text(
                          'error_message'.tr(args: [state.message]),
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('fetch_weather_prompt'.tr()),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetailCard(
      BuildContext context, String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
