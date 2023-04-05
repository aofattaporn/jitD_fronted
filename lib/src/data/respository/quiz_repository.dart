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

  Future<String> calStressQuizResult(String point) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.put(
        Uri.parse("${globalUrl}v1/test/stress/result/point/$point"),
        headers: {
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

  Future<String> getStressQuizResult() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.get(
        Uri.parse("${globalUrl}v1/test/stress/result"),
        headers: {
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

  Future<String> getConsultQuiz() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
    await http.get(Uri.parse("${globalUrl}v1/test/consult"), headers: {
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

  Future<String> calConsultQuizResult(String point) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.put(
        Uri.parse("${globalUrl}v1/test/consult/result/point/$point"),
        headers: {
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

  Future<String> getConsultQuizResult() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.get(
        Uri.parse("${globalUrl}v1/test/consult/result"),
        headers: {
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
