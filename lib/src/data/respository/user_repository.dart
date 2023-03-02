import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../constant/constant_url.dart';
import '../models/pet_model.dart';

class UserRepository {
  Future<String> getMyUser() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.get(Uri.parse("${globalUrl}v1/users/id"), headers: {
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

  Future<String> namingPet(String? petName) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    final response = await http.put(Uri.parse("${globalUrl}v1/users/pet/id"),
        body: petModelToJson(PetModel(petName)),
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

  // Future<String> namingPet(String? petName) async {
  //   String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
  //   print(token);
  //   final response = await http.put(Uri.parse("${globalUrl}v1/users/pet/id"),
  //       body: petModelToJson(PetModel(petName)),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       });
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "Failed to name your pet";
  //   }
  // }

}
