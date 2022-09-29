import 'package:ccn_weather/services/weather_service/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.I;

Future locatorSetup() async {

  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator.registerLazySingleton(() => WeatherService());

}