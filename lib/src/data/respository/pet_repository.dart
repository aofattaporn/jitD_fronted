import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:jitd_client/src/data/models/pet_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/test_model.dart';

class PetRepository {
  final String _petNamingUrl =
      "https://jitd-backend.onrender.com/v1/users/pet/id";

  Future<String> NamingPetEvent(String? PetName) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    final response = await http.put(Uri.parse(_petNamingUrl),
        body: petModelToJson(PetModel(PetName)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return "Naming pet successfully";
    } else {
      return "Failed to name your pet";
    }
  }
}
