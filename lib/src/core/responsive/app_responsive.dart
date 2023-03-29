import 'package:flutter/material.dart';
import 'package:rawg/src/core/utils/app_strings.dart';

class AppResponsive {
  static const kBorderRadius = 12.0;
  static const kdefaultPadding = 12.0;
  static double height(BuildContext context) {
    double? size = MediaQuery.of(context).size.height;
    return size;
  }

  static double width(BuildContext context) {
    double? size = MediaQuery.of(context).size.width;
    return size;
  }

  static double fontSize(BuildContext context) {
    // final scale = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3);
    double? size = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.0);
    return size;
  }

  static double kminiFont(BuildContext context) {
    double? size = fontSize(context) * 10;
    return size;
  }

  static double ksmallFont(BuildContext context) {
    double? size = fontSize(context) * 12;
    return size;
  }

  static double kmediumFont(BuildContext context) {
    double? size = fontSize(context) * 14;
    return size;
  }

  static double klargeFont(BuildContext context) {
    double? size = fontSize(context) * 16;
    return size;
  }

  static double kextraLargeFont(BuildContext context) {
    double? size = fontSize(context) * 18;
    return size;
  }

  static double kmaxExtraLargeFont(BuildContext context) {
    double? size = fontSize(context) * 20;
    return size;
  }

  static responsiveTextStyle(
    BuildContext context, {
    double? letterSpacing,
    double? fsize,
    FontWeight? fweight,
    Color? tColor,
    String? fontFamily,
    TextOverflow? ovrflow = TextOverflow.ellipsis,
  }) =>
      TextStyle(
        color: tColor ?? Theme.of(context).primaryColorDark,
        letterSpacing: letterSpacing,
        fontSize:
            fsize != null ? fontSize(context) * fsize : kmediumFont(context),
        //  overflow: overf ?? ovrflow,
        fontFamily: fontFamily ?? AppStrings.rubiesqueFont,
        fontWeight: fweight,
      );
}
