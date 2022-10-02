import 'package:ccn_weather/ui/home/home_view_model.dart';
import 'package:ccn_weather/utils/decorator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    Future.microtask(() => context.read<HomeViewModel>().init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text('Home Weather', style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black)),
          ),
          body: model.isLoading! ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('loading...', style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 15),),
                ],
              ),
            ),
          ) : model.weatherModel != null ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Text(
                    "Current Location: ${model.weatherModel!.timezone}", style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text(
                      "Current Weather", style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecorators.outlineContainerDecoration(width: 1, radius: 20, color: Colors.black.withOpacity(0.3)),
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${model.weatherModel!.current!.temp.toString()} \u00B0C", style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 38),
                        ),
                      ),
                    ),
                  ],),
                  const SizedBox(height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hourly Weather", style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      const SizedBox(height: 10,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                          ...List.generate(model.weatherModel!.hourly!.length, (index) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecorators.outlineContainerDecoration(width: 1, radius: 29, color: Colors.black.withOpacity(0.3)),
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Text(
                                        "${model.weatherModel!.hourly![index].temp.toString()} \u00B0C", style: const TextStyle(
                                          fontWeight: FontWeight.w700, fontSize: 20),
                                      ),
                                ],),
                                  ),
                                ),
                              ),
                          )
                        ],),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ) : const Text('No Weather Data'),
        );
      }
    );
  }
}