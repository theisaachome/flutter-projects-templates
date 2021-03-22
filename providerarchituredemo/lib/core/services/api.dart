import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:providerarchituredemo/core/models/comment.dart';
import 'package:providerarchituredemo/core/models/post.dart';
import 'package:providerarchituredemo/core/models/user.dart';

class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';
  var client = new http.Client();
  Future<User> getUserProfile(int userId) async {
    final response = await client.get("$endpoint/users/$userId");
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    List<Post> posts = [];
    final response = await http.get("$endpoint/posts?userId=$userId");
    print(response.body);
    posts =
        List<Post>.from(json.decode(response.body).map((p) => Post.fromJson(p)))
            .toList();
    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    List<Comment> comments = [];
    final response = await client.get("$endpoint/comments?postId=$postId");
    final parsed = json.decode(response.body);
    comments = parsed.map((c) => Comment.fromJson(c));
    return comments;
  }
}
