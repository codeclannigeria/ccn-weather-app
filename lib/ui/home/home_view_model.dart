import 'package:ccn_weather/models/weather_model.dart';
import 'package:ccn_weather/services/weather_service/weather_service.dart';
import 'package:ccn_weather/utils/locator_setup.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  final weatherService = serviceLocator<WeatherService>();

  String lat = '6.52970';
  String lng = '3.2934885';

  WeatherModel? weatherModel;

  bool? isLoading = false;

  Future<void> init() async {
    setIsLoading(v: true);
    await weatherService.getWeatherDetails(lng: lng, lat: lat).then((value) {
      weatherModel = value;
      setIsLoading(v: false);
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
  }


  void setIsLoading({bool? v}){
    isLoading = v;
    notifyListeners();
  }


}