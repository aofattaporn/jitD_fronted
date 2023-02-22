import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:jitd_client/src/data/models/comment_model.dart';

class CommentRepository {
  final String globalUrl = "https://jitd-backend.onrender.com/";
  final String localUrl = 'http://localhost:3000/';

  Future<String> creatingComment(
      String? content, String? postId, String? Date) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.post(Uri.parse("${localUrl}v1/comments/post/$postId"),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: commentModelToJson(CommentModel.PostContent(content)));
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 502) {
      return response.body;
    } else {
      print(response.statusCode);
      return "somthing fail.";
    }
  }

  Future<String> getCommented(String? postId) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http
        .get(Uri.parse("${localUrl}v1/comments/post/$postId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      return "somthing fail.";
    }
  }

  Future<String> deleteComment(String? commentId, String? postId) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.delete(
        Uri.parse("${localUrl}v1/comments/$commentId/post/$postId/"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "some thing wrong : ${response.body}";
    }
  }

  Future<Object> updateComment(
      String? content, String? date, String? postId, String? commentId) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.put(
        Uri.parse("${localUrl}v1/comments/$commentId"),
        body: commentModelToJson(
            CommentModel.Resquest(content, date, postId, commentId)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return "updating data success";
    } else {
      print(response.statusCode);
      return "something fail.";
    }
  }
}
