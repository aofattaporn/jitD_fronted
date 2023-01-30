import 'package:jitd_client/src/data/models/post_model.dart';

import 'data/models/test_model.dart';

class Cache {
  static TestModel? _data_home_page;

  static TestModel? get get_data_home_page => _data_home_page;

  static void set set_data_home_page(TestModel? value) {
    _data_home_page = value;
  }
}

class PostCache {
  static PostModel? _dataPost;
  static PostModel? get getDataPost => _dataPost;

  static void set setDataPost(PostModel? value) {
    _dataPost = value;
  }
}