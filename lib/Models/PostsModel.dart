import 'dart:convert';

List<PostsModel> postmodelsToJson(String str) {
  var postsJson = json.decode(str) as List;
  List<PostsModel> posts = [];
  postsJson.forEach((element) {
    posts.add(PostsModel.fromJson(element));
  });
  return posts;
}

class PostsModel {
  int userId;
  String title;
  String body;
  PostsModel({required this.userId, required this.title, required this.body});
  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
      body: json["body"], title: json["title"], userId: json["userId"]);
}
