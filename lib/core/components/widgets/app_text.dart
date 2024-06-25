import 'package:flutter/material.dart';
import 'responsive.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? linHeight;
  final double? letterSpacing;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final int? maxLines;
  final bool? softWrap;

  const AppText({
    required this.text,
    super.key,
    required this.fontSize,
    this.linHeight,
    this.letterSpacing,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.decoration,
    this.overflow,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.maxLines,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    var fontSizeEd = 14.0;
    if (Responsive.isDesktop(context)) {
      final fontSize2 = fontSize == null
          ? 14 / MediaQuery.devicePixelRatioOf(context)
          : (MediaQuery.of(context).size.width) / 6 / (fontSize!);
      fontSizeEd = fontSize2;
    } else if (Responsive.isTablet(context)) {
      final fontSize2 = fontSize == null
          ? 14 / MediaQuery.devicePixelRatioOf(context)
          : (MediaQuery.of(context).size.width) / 4 / (fontSize!);
      fontSizeEd = fontSize2;
    } else {
      final fontSize2 = fontSize == null
          ? 14 / MediaQuery.devicePixelRatioOf(context)
          : (MediaQuery.of(context).size.width) / 2 / (fontSize!);
      fontSizeEd = fontSize2;
    }

    final style = TextStyle(
      fontSize: fontSizeEd,
      letterSpacing: letterSpacing ?? 1,
      color: color ?? Colors.black,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: decoration ?? TextDecoration.none,
      height: linHeight ?? 1.5,
      fontFamily: 'Inter',
    );
    return Text(text,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        softWrap: softWrap,
        textScaler: const TextScaler.linear(1),
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior);
  }
}

double fontSized(BuildContext context, double? fontSize) {
  var fontSizeEd = 14.0;
  if (Responsive.isDesktop(context)) {
    final fontSize2 = fontSize == null
        ? 14 / MediaQuery.devicePixelRatioOf(context)
        : (MediaQuery.of(context).size.width) / 6 / (fontSize);
    fontSizeEd = fontSize2;
  } else if (Responsive.isTablet(context)) {
    final fontSize2 = fontSize == null
        ? 14 / MediaQuery.devicePixelRatioOf(context)
        : (MediaQuery.of(context).size.width) / 4 / (fontSize);
    fontSizeEd = fontSize2;
  } else {
    final fontSize2 = fontSize == null
        ? 14 / MediaQuery.devicePixelRatioOf(context)
        : (MediaQuery.of(context).size.width) / 2 / (fontSize);
    fontSizeEd = fontSize2;
  }
  return fontSizeEd;
}
