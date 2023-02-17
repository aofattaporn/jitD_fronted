import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jitd_client/src/data/models/comment_model.dart';

class CommentRepository {
  final String globalUrl = "https://jitd-backend.onrender.com/";

  Future<String> creatingComment(String? content,String? postId,String? Date) async {
    String Date = DateTime.now().toString();
    String? id = FirebaseAuth.instance.currentUser?.uid;
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.post(
        Uri.parse("${globalUrl}v1/comments/$id"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: commentModelToJson(
            CommentModel(content,postId,Date)));

    if (response.statusCode == 200) {
      return "create data success";
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
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      return "somthing fail.";
    }
  }
}
