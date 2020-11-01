import 'package:flutter_api_test/src/model/comment.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/comments";
  Client client = Client();

  Future<List<Comment>> getComment() async {
    final response = await client.get("https://jsonplaceholder.typicode.com/comments");
    if (response.statusCode == 200) {
      return commentFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createComment(Comment data) async {
    final response = await client.post("https://jsonplaceholder.typicode.com/comments",
      headers: {"content-type": "application/json"},
      body: commentToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateComment(Comment data) async {
    final response = await client.put("https://jsonplaceholder.typicode.com/comments/${data.id}",
      headers: {"content-type": "application/json"},
      body: commentToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteComment(int id) async {
    final response = await client.delete(
      "https://jsonplaceholder.typicode.com/comments/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
