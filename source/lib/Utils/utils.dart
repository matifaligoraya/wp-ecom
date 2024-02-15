import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CachedNetworkImage networkImage(String imageString,double height,double width) {
  try {
    return CachedNetworkImage(
      fit: BoxFit.fitWidth,
      height: height,
      width: width,
      imageUrl: imageString,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CupertinoActivityIndicator.partiallyRevealed(progress: (downloadProgress.progress ?? 1.0))),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  } catch (e) {
    throw Exception("Error decoding base64 image: $e");
  }
}

CachedNetworkImage cachenetworkImage(String imageString,double height,double width) {
  try {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: height,
      width: width,
      imageUrl: imageString,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CupertinoActivityIndicator.partiallyRevealed(progress: (downloadProgress.progress ?? 1.0))),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  } catch (e) {
    throw Exception("Error decoding base64 image: $e");
  }
}