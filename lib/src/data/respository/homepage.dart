import 'package:http/http.dart' as http;

class HomePageRepository {
  final String _baseUrl = "waiting for url";

  Future<String> getHomePage() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 201) {
      return "create data success";
    } else {
      return "something fail.";
    }
  }

  // Future<TestModel> getHomePageByCacheLib() async {
  //   var file = await DefaultCacheManager().getSingleFile(_baseUrl.toString());
  //   var data = testModelFromJson(file.readAsStringSync());
  //
  //   if (data == null) {
  //     throw Exception("Failed to load joke");
  //   } else {
  //     return data;
  //   }
  // }
}
