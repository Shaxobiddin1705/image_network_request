class PhotoLists{
  late List<Photo> photoLists;
  
  PhotoLists({required this.photoLists});
  
  PhotoLists.fromJson(List json) {
    photoLists = json.map((e) => Photo.fromJson(e)).toList();
  }

  List toJson() {
    List list;
    list = photoLists.map((e) => e.toJson()).toList();
    return list;
  }
}

class Photo {
  late int albumId;
  late int id;
  late String title;
  late String url;
  late String thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() => {
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl
      };
}
