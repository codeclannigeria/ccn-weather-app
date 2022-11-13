import 'package:flutter/material.dart';


///with MaterialRoute
void push({BuildContext? context, Widget? route, bool isDialog = false}) =>
    Navigator.push(
      context!,
      MaterialPageRoute<dynamic>(
        fullscreenDialog: isDialog,
        builder: (BuildContext context) => route!,
      ),
    );

void pushUntil({BuildContext? context, Widget? route}) {
  Navigator.pushAndRemoveUntil(context!,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) {
    return route!;
  }), (Route<dynamic> route) => false);
}

void pushReplacement({BuildContext? context, Widget? route}) {
  Navigator.pushReplacement(context!,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return route!;
      }),);
}

void pop({BuildContext? context, Widget? route}) {
  Navigator.of(context!).pop();
}


///With NamedRoute
void pushToNamed({BuildContext? context, String? route, Object? arguments}) {
  if (arguments != null) {
    Navigator.pushNamed(context!, route!, arguments: arguments);
  } else {
    Navigator.pushNamed(context!, route!);
  }
}