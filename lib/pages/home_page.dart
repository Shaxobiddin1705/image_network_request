import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network_request/models/photo_model.dart';
import 'package:image_network_request/pages/full_photo_page.dart';
import 'package:image_network_request/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List photoItems = [];

  void _photoList() {
    Network.getHttps(Network.apiList, Network.paramsEmpty()).then((value) {
      if (value != null) {
        _showPhoto(value);
      }
    });
  }

  void _showPhoto(String photo) {
    PhotoLists photoList = Network.parsePhotoList(photo);
    setState(() {
      photoItems = photoList.photoLists;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _photoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return (photoItems.isNotEmpty
                    ? _widget(index)
                    : CircularProgressIndicator());
              }),
        ),
      ),
    );
  }

  Widget _widget(int index) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      alignment: Alignment.centerLeft,
      height: 170,
      child: Row(
        children: [
          GestureDetector(
            child: CachedNetworkImage(
              imageUrl: photoItems[index].thumbnailUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error_outlined),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FullPhotoPage(imageUrl: photoItems[index].url)));
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.47,
            child: Text(
              photoItems[index].title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
