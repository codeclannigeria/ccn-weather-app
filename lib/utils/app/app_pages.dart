import 'package:ccn_weather/ui/details/details_view.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.detailsView: (context) => const DetailsView(),
  };
}