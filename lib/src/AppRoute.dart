import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/screens/post/ViewAllPost.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';

class AppRoute {
  static const view_post = 'view_post';
  static const view_all_post = 'view_all_post';

  final _route = <String, WidgetBuilder>{
    // view_post: (context) => ViewPost(title: "ViewPost"),
    view_all_post: (context) => ViewAllPost(),

  };

  get getAll => _route;
}