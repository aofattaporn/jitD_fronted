import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../constant/constant_url.dart';

class QuizRepository {
  Future<String> getStressQuiz() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.get(Uri.parse("${globalUrl}v1/test/stress"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Something wrong";
    }
  }

}