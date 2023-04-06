import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant.dart';

class ShimmerCateSearch extends StatelessWidget {
  const ShimmerCateSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: skeletonColor,
      highlightColor: skeletonHighlightColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.085,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                        color: skeletonColor,
                        borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(10)
                        ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.085,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.085,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.085,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.085,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*2,
                      left: MediaQuery.of(context).devicePixelRatio*3),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.045,
                    decoration: const BoxDecoration(
                      color: skeletonColor,
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
