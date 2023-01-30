import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jitd_client/src/data/models/comment_model.dart';

class CommentRepository {
  final String _urlCreatingComment = "http://localhost:3000/v1/comments/";

  Future<String> creatingComment(String? content, String? like, String? userId, String? date) async {
    String date = DateTime.now().toString();
    String? id = FirebaseAuth.instance.currentUser?.uid;
    final response = await http.post(Uri.parse(_urlCreatingComment + id!),
        body: commentModelToJson(CommentModel(content, like, userId, date)));

    if (response.statusCode == 200) {
      return "create data success";
    } else {
      print(response.statusCode);
      return "somthing fail.";
    }
  }
}
