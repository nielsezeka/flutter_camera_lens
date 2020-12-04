import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/screens/view_index.dart';

class AppImage extends StatelessWidget {
  final String thumbUrl;
  final String url;

  const AppImage({Key key, this.thumbUrl, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Image.network(
          thumbUrl,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
