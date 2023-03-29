import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CacheImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? imgheight;
  final double? imgwidth;
  final BoxFit? cFit;
  final bool fromAsset;
  const CacheImageWidget({
    Key? key,
    this.imageUrl,
    this.imgheight,
    this.imgwidth,
    this.cFit,
    this.fromAsset = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fromAsset
        ? ExtendedImage.asset(
            imageUrl!,
            width: imgwidth ?? double.infinity,
            height: imgheight,
            fit: cFit ?? BoxFit.fill,
            //cancelToken: cancellationToken,
          )
        : ExtendedImage.network(
            imageUrl!,
            width: imgwidth ?? double.infinity,
            height: imgheight,
            fit: cFit ?? BoxFit.fill,
            timeRetry: const Duration(seconds: 1),
            cache: true,
            clearMemoryCacheWhenDispose: true,
            retries: 5,

            //cancelToken: cancellationToken,
          );
  }
}
