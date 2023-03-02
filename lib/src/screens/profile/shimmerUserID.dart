import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant.dart';

class ShmmimerUserID extends StatelessWidget {
  const ShmmimerUserID({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: skeletonColor,
      highlightColor: skeletonHighlightColor,
      child: Container(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).devicePixelRatio * 5.3,
            bottom: MediaQuery.of(context).devicePixelRatio * 3),
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: skeletonColor)
      ),
    );
  }
}
