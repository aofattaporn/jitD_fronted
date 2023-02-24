import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:jitd_client/src/constant/constant_url.dart';

class LikeRepository {

  Future<void> likePost({required String? postId}) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    String postIdCheck = postId!;
    await http.put(
        Uri.parse("${globalUrl}v1/like/post/$postIdCheck"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
  }

  Future<void> unlikePost({required String? postId}) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    String postIdCheck = postId!;
    await http.put(
        Uri.parse("${globalUrl}v1/unlike/post/$postIdCheck"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
  }

  Future<void> likeComment({required String? commentId, required String? postId}) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    String commentIdCheck = commentId!;
    String postIdCheck = postId!;
    await http.put(
        Uri.parse("${globalUrl}v1/like/comment/$commentIdCheck/post/$postIdCheck"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
  }

  Future<void> unlikeComment({required String? commentId, required String? postId}) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    String commentIdCheck = commentId!;
    String postIdCheck = postId!;
    await http.put(
        Uri.parse("${globalUrl}v1/unlike/comment/$commentIdCheck/post/$postIdCheck"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
  }
}
