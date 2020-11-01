import 'dart:convert';

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment({this.postId = 0, this.id = 0, this.name, this.email, this.body});

  factory Comment.fromJson(Map<String, dynamic> map) {
    return Comment(
        postId: map["postId"],
        id: map["id"],
        name: map["name"],
        email: map["email"],
        body: map["body"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "postId": postId,
      "id": id,
      "name": name,
      "email": email,
      "body": body
    };
  }

  @override
  String toString() {
    return 'Comment{postId: $postId, id: $id, name: $name, email: $email, body: $body}';
  }
}

List<Comment> commentFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Comment>.from(data.map((item) => Comment.fromJson(item)));
}

String commentToJson(Comment data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
