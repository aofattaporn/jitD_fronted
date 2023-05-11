import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../constant/constant_url.dart';
import '../models/post_model.dart';

class PostRepository {
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
      return response.body;
    } else {
      print(response.statusCode);
      return "something fail.";
    }
  }

  Future<String> getAllPost() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    final response =
        await http.get(Uri.parse("${globalUrl}v1/posts/"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "something fail.";
    }
  }

  Future<String> getHomePagePost() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.get(Uri.parse("${globalUrl}v1/posts/homepage"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "something fail.";
    }
  }


  Future<String> getMyPost() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.get(Uri.parse("${globalUrl}v1/posts/id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "something fail.";
    }
  }

  Future<String> getMyBookMark() async{
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.get(Uri.parse("${globalUrl}v1/posts/bookmark"), headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "something fail.";
    }
  }

  Future<String>RemoveBookMark(String postId) async{
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.put(Uri.parse("${globalUrl}v1/posts/bookmark/remove/$postId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return "Remove Successfully";
    } else {
      int status = response.statusCode;
      String msg = response.body;
      return "something fail status $status msg :$msg";
    }
  }

  Future<String>AddBookMark(String postId) async{
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.put(Uri.parse("${globalUrl}v1/posts/bookmark/add/$postId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return "Add Successfully";
    } else {
      int status = response.statusCode;
      String msg = response.body;
      return "something fail status $status msg :$msg";
    }
  }

  Future<String> getSearchPage() async{
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.get(Uri.parse("${globalUrl}v1/like/post/catrogory"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "something fail.";
    }
  }

  Future<String> getSearchByCate() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.get(Uri.parse("${globalUrl}v1/like/post/catrogory"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "something fail.";
    }
  }

  Future<String> getPostBySearch(String content) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    String query = content.trim();

    final response = await http
        .get(Uri.parse("${globalUrl}v1/posts/keyword/$query"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      return "Data not found";
    }
  }

  Future<String> deletePost(String id) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.delete(Uri.parse("${globalUrl}v1/posts/$id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      int status = response.statusCode;
      String msg = response.body;

      return "something fail status $status msg :$msg";
    }
  }
}
