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
        Uri.parse("${globalUrl}v1/comments/$postId"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: commentModelToJson(
            CommentModel(content)));
        print(response.body);
    if (response.statusCode == 200) {
      return "create data success";
    }else if(response.statusCode == 502){
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

  Future<Object> deleteComment(String? commentId, String? postId) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.delete(
        Uri.parse("${globalUrl}v1/comments/$commentId/post/$postId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return "delete post success";
    } else {
      return CommentModel.withError("Data not found");
    }
  }

  Future<Object>updateComment(String? content, String? date, String? postId, String? commentId) async{
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.put(Uri.parse("${globalUrl}v1/comments/$commentId"),
    body: commentModelToJson(CommentModel.Resquest(content, date, postId, commentId)),
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
