class PostModel {
  String name, text, profileImage;
  List<String> images;
  int time, like, comments;
  PostModel(
      {required this.text,
      required this.name,
      required this.images,
      required this.time,
      required this.profileImage,
      required this.comments,
      required this.like});
}
