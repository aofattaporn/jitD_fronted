import 'package:jitd_client/src/data/models/post_model.dart';

class PostCache {
  static PostModel? _dataPost;
  static PostModel? get getDataPost => _dataPost;

  static void set setDataPost(PostModel? value) {
    _dataPost = value;
  }
}
