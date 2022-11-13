import 'package:ccn_weather/utils/decorator.dart';
import 'package:ccn_weather/utils/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {

  final Map<String, dynamic>? detailsValue;
  const DetailsView({Key? key, this.detailsValue}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {

  Map<String, dynamic>? detailsValue = {};

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    detailsValue = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: (){
            pop(context: context);
          },
         child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,)
        ),
        title: const Text('Details', style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const Text(
            "Current weather Value", style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 30,),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecorators.outlineContainerDecoration(width: 1, radius: 20, color: Colors.black.withOpacity(0.3)),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                detailsValue != null ? detailsValue!['current_weather'] ?? '' : '', style: const TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 38),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}