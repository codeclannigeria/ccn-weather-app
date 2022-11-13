import 'package:ccn_weather/ui/home/home.dart';
import 'package:ccn_weather/utils/app/app_pages.dart';
import 'package:ccn_weather/utils/locator_setup.dart';
import 'package:ccn_weather/utils/provider_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  locatorSetup();
  runApp(MultiProvider(providers: providers, child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CCNW',
      initialRoute: AppPages.initialRoute,
      routes: AppPages.routes,
      theme: ThemeData(
        primaryColor: Color(0xFF322DC4),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFFFFFFF),
        dividerColor: Colors.white54,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Material(
        child: Builder(builder: (BuildContext context) {
          return Home();
        }),
      ),
    );
  }
}
