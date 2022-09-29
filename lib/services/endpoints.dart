class Endpoints {

  static String weatherAPI({String? lat, String? lng, String? appID}) => 'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lng&appid=$appID&units=metric';

}