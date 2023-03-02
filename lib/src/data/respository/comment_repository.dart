import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:jitd_client/src/constant/constant_url.dart';
import 'package:jitd_client/src/data/models/comment_model.dart';

class CommentRepository {
  Future<String> creatingComment(
      String? content, String? postId, String? Date) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.post(Uri.parse("${globalUrl}v1/comments/post/$postId"),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: commentModelToJson(CommentModel.PostContent(content)));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
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
        .get(Uri.parse("${globalUrl}v1/comments/post/$postId"), headers: {
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
    String commentIdCheck = commentId!;
    String postIdCheck = postId!;
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.delete(
        Uri.parse("${globalUrl}v1/comments/$commentIdCheck/post/$postIdCheck/"),
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

  Future<String> updateComment(
      String? content, String? date, String? postId, String? commentId) async {
    String commentIdCheck = commentId!;
    String postIdCheck = postId!;
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.put(
        Uri.parse("${globalUrl}v1/comments/$commentIdCheck/post/$postIdCheck/"),
        body: commentModelToJson(CommentModel.PostContent(content)),
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
}
