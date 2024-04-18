import 'package:flutter/cupertino.dart';

abstract class ImageLoader {
  ImageProvider load(String url);
}

class NetworkImageLoader implements ImageLoader {
  @override
  ImageProvider load(String url) {
    return NetworkImage(url);
  }
}

class AssetImageLoader implements ImageLoader {
  @override
  ImageProvider load(String url) {
    return const AssetImage('assets/pasya_logo.png'); // replace with your local test image
  }
}