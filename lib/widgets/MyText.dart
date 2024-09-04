import 'package:tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';


class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  MyText(
      {required this.title,
      required this.color,
      required this.size,
      this.alien,
      this.fontFamily,
      this.decoration,
      this.letterSpace,
      this.wordSpace,
      this.overflow,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: alien ?? TextAlign.start,
      textScaleFactor: WidgetUtils.textScaleFactor??1.2,
      style: TextStyle(
          color: color??Colors.black,
          fontSize: size??16,
          letterSpacing: letterSpace,
          wordSpacing: wordSpace,
          decoration: decoration??TextDecoration.none,
          fontWeight: fontWeight??(WidgetUtils.lang=="ar"?FontWeight.w500:FontWeight.w200),
        fontFamily: fontFamily??WidgetUtils.fontFamily,
      ),
      overflow: overflow,
    );
  }
}
