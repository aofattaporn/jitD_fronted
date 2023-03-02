import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../constant/constant_url.dart';

class DailyQuestRepository {
  Future<String> getMyQuest() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response =
        await http.get(Uri.parse("${globalUrl}v1/quest/id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Failed to get my quest";
    }
  }

  Future<String> updatingQuest(String? questName, String? myPoint) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response = await http.get(Uri.parse("${globalUrl}v1/quest/$questName/myPoint/$myPoint"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Failed to update quest";
    }
  }
}
