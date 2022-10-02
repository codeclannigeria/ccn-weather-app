import 'package:ccn_weather/ui/home/home_view_model.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel())
];