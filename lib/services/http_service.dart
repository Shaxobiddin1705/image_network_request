import 'dart:convert';

import 'package:http/http.dart';
import 'package:image_network_request/models/photo_model.dart';

class Network {
  static String baseApi = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  static String apiList = "/photos";

  static Future<String?> getHttps(
      String api, Map<String, String> params) async {
    var uri = Uri.https(baseApi, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  // static PhotoLists parsePhotoList(String body) {
  //   var json = jsonDecode(body);
  //   PhotoLists photos = PhotoLists.fromJson(json);
  //   return photos;
  // }


  static PhotoLists parsePhotoList(String body) {
    List json = jsonDecode(body);
    PhotoLists list = PhotoLists.fromJson(json);
    return list;
  }

  static Photo parseUserOne(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    Photo photo = Photo.fromJson(json);
    return photo;
  }
}
