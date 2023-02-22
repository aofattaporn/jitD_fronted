import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant.dart';

class SkeletonComment extends StatelessWidget {
  const SkeletonComment({
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
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).devicePixelRatio * 25,
              top: MediaQuery.of(context).devicePixelRatio * 5,
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.235,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: skeletonColor),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
