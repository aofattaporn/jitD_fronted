import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant.dart';

class ShimmerMyPost extends StatelessWidget {
  const ShimmerMyPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: skeletonColor,
      highlightColor: skeletonHighlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: skeletonColor),
            ),
          ),
        ],
      ),
    );
  }
}
