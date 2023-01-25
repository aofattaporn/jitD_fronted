import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

import '../models/post_model.dart';
import '../models/test_model.dart';

class PostRepository {
  final String localUrl = "http://localhost:3000/";
  final String globalUrl = "https://jitd-backend.onrender.com/";

  Future<String> creatingPost(
      String? content, bool? isPublic, List<String> category) async {
    String date = DateTime.now().toUtc().toString();
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    final response = await http.post(Uri.parse("${globalUrl}v1/posts/"),
        body:
            postModelToJson(PostModel.Resquest(content, date, true, category)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return "create data success";
    } else {
      print(response.statusCode);
      return "something fail.";
    }
  }
}