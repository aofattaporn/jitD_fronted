import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../constant.dart';

class BlockWords extends StatefulWidget {
  const BlockWords({Key? key}) : super(key: key);

  @override
  BlockWordsState createState() => BlockWordsState();
}

class BlockWordsState extends State<BlockWords> {
  TextEditingController? textController;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final panelController = PanelController();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      // resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1, -0.95),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 16),
                                padding:
                                    const EdgeInsets.fromLTRB(32, 10, 32, 10),
                                // backgroundColor: thirterydColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                )),
                            child: const Text("โพส"),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -0.75),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -0.3),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                        Align(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(0, 0.65),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF8FAFA),
                                    ),
                                    child: Stack(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
