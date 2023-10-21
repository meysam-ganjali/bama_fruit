import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageLoadService extends StatelessWidget {
  final imagePath;
  const ImageLoadService({
    super.key,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
    );
  }
}