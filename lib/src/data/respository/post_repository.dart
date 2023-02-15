import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostRepository {
  final String localUrl = "http://localhost:3000/";
  final String globalUrl = "https://jitd-backend.onrender.com/";

  Future<String> creatingPost(
      String? content, bool? isPublic, List<String> category) async {
    String date = DateTime.now().toUtc().toString();
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
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
      return "Something fail.";
    }
  }

  Future<String> updatingPost(String content, String date, bool isPublic,
      List<String> category, String postID) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.put(Uri.parse("${globalUrl}v1/posts/$postID"),
        body:
            postModelToJson(PostModel.Resquest(content, date, true, category)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return "updating data success";
    } else {
      print(response.statusCode);
      return "something fail.";
    }
  }

  Future<Object> getAllPost() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    // print('${token}|dddddddddddddd');
    final response =
        await http.get(Uri.parse("${globalUrl}v1/posts/"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return PostModel.withError("Data not found");
    }
  }

  Future<Object> getMyPost() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.get(Uri.parse("${globalUrl}v1/posts/id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return PostModel.withError("Data not found");
    }
  }

  Future<Object> deletePost(String id) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.delete(Uri.parse("${globalUrl}v1/posts/$id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      return "delete post success";
    } else {
      return PostModel.withError("Data not found");
    }
  }
}
