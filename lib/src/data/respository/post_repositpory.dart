import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

import '../models/post_model.dart';
import '../models/test_model.dart';

class PostRepository {
  final String _urlCreatingPost = "http://localhost:3000/v1/posts/";

  Future<String> creatingPost(String? content, bool? IsPublic ) async {
    String date = DateTime.now().toString();
    String? id = FirebaseAuth.instance.currentUser?.uid;
    final response = await http.post(Uri.parse(_urlCreatingPost + id!),
        body: postModelToJson(PostModel(content, "2023-01-16T23:28:13.418485+07:00", true)));

    print("2023-01-16T23:28:13.418485+07:00");
    print(date);

    print(DateTime.now());
    if (response.statusCode == 200) {
      return "create data success";
    } else {
      print(response.statusCode);
      return "somthing fail.";
    }
  }
}
