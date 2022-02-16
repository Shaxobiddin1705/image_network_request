import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullPhotoPage extends StatefulWidget {
  late String imageUrl;
  FullPhotoPage({Key? key, required this.imageUrl}) : super(key: key);
  static const String id = "full_photo_page";

  @override
  _FullPhotoPageState createState() => _FullPhotoPageState();
}

class _FullPhotoPageState extends State<FullPhotoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.imageUrl.isNotEmpty ? CachedNetworkImage(
          imageUrl: widget.imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error_outlined),
        ) : CircularProgressIndicator(),
        //photoItems[int.parse(widget.index)].url
      ),
    );
  }
}
