import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

mixin BoxDecorators {

  static BoxDecoration outlineContainerDecoration({Color? color, double? width = 1, double? radius}) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular( radius ?? 11),
          border: Border.all(
            color: color ?? XColors.accentColor,
            width: width!,
          ),
      );
}