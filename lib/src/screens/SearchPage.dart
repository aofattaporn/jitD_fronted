import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RiveAnimation.asset("assets/image/beear_login.riv")
      ),
    );
  }
}
