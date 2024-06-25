// ignore_for_file: depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/string_extension.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/widget_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int defaultElevation = 4;
double defaultRadius = 8.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultAppBarElevation = 4.0;

class CacheImage extends StatelessWidget {
  const CacheImage(
      {super.key,
      required this.url,
      required this.height,
      required this.width,
      this.widget});
  final String? url;
  final double? height;
  final double? width;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.colorBurn,
            ),
          ),
        ),
        child: widget,
      ),
      placeholder: (context, url) =>
          const Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

Widget cachedImage(String? url,
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    bool usePlaceholderIfUrlEmpty = true,
    double? radius}) {
  if (url.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return Image.network(
      url!,
      height: height,
      width: width,
      fit: fit,
      errorBuilder:
          (BuildContext? context, Object? exception, StackTrace? stackTrace) {
        return Image.asset('assets/placeholder.jpg',
                height: height,
                width: width,
                fit: fit,
                alignment: alignment ?? Alignment.center)
            .cornerRadiusWithClipRRect(radius ?? defaultRadius);
      },
      alignment: alignment as Alignment? ?? Alignment.center,
    );
  } else {
    return Image.asset('assets/placeholder.jpg',
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('assets/good_big.png',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
