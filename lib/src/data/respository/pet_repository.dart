import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:jitd_client/src/data/models/pet_model.dart';

class PetRepository {
  final String localUrl = 'http://localhost:3000/';
  final String globalUrl = "https://jitd-backend.onrender.com/";

  Future<String> NamingPetEvent(String? PetName) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    final response = await http.put(Uri.parse("${globalUrl}v1/users/pet/id"),
        body: petModelToJson(PetModel(PetName)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Failed to name your pet";
    }
  }

  Future<Object> GetPetName() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.put(Uri.parse("${globalUrl}v1/users/pet/id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return PetModel.withError("Data not found");
    }
  }
}
