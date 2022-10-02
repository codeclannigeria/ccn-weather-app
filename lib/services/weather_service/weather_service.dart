import 'dart:convert';
import 'dart:developer';
import 'package:ccn_weather/models/weather_model.dart';
import 'package:ccn_weather/services/api_helper.dart';
import 'package:ccn_weather/services/endpoints.dart';
import 'package:ccn_weather/utils/key_const.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  WeatherModel? weatherModel;

  Future<WeatherModel> getWeatherDetails({String? lat, String? lng}) async {

    try {

      var response = await http.get(Uri.parse(Endpoints.weatherAPI(lat: lat, lng: lng, appID:AppConst.weatherAPI),),
          headers: APIHelper().requestHeaders);
      var jsonData = jsonDecode(response.body);

      //log(jsonData.toString());

      weatherModel = WeatherModel.fromJson(jsonData!);
      return weatherModel!;

    } catch (e) {

      rethrow;

    }

  }



}