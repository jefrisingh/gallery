class PixabayImage {
  int id;
  String user;
  String userImageURL;
  String previewURL;
  String largeImageURL;
  int likes;
  int views;
  int comments;

  PixabayImage({
    required this.id,
    required this.user,
    required this.userImageURL,
    required this.previewURL,
    required this.largeImageURL,
    required this.likes,
    required this.views,
    required this.comments,
  });

  factory PixabayImage.fromJson(Map<String, dynamic> json) {
    return PixabayImage(
      id: json['id'],
      user: json['user'],
      userImageURL: json['userImageURL'],
      previewURL: json['previewURL'],
      largeImageURL: json['largeImageURL'],
      likes: json['likes'],
      views: json['views'],
      comments: json['comments'],
    );
  }
}
