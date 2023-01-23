import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_homepage extends StatefulWidget {
  const Setting_homepage({Key? key}) : super(key: key);

  @override
  State<Setting_homepage> createState() => _Setting_homepageState();
}

class _Setting_homepageState extends State<Setting_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "หน้าหลัก",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                child: Text("Open Bottom Sheet"),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (context) => Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            //Icon(Icons.key_off_outlined),
                            child: ElevatedButton.icon(

                              onPressed: () {
                                //print("ซ่อนความคิดเห็น");
                              },
                              icon: Icon(Icons.visibility_off_outlined),
                              //icon data for elevated button
                              label: Text("ซ่อนความคิดเห็น"),
                              //label text
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0)),
                                  minimumSize: Size(200, 40), //////// HERE
                                  primary: Colors
                                      .blueAccent //elevated btton background color
                              ),
                            ),
                          ),
                          Align(
                            //Icon(Icons.key_off_outlined),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                //print("ปักหมุดความคิดเห็น");
                              },
                              icon: Icon(Icons.push_pin_outlined),
                              //icon data for elevated button
                              label: Text("ปักหมุดความคิดเห็น"),
                              //label text
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0)),
                                  minimumSize: Size(200, 40), //////// HERE
                                  primary: Colors
                                      .blueAccent //elevated btton background color
                              ),
                            ),
                          ),
                          Align(
                            //Icon(Icons.key_off_outlined),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                //print("ปักหมุดความคิดเห็น");
                              },
                              icon: Icon(Icons.delete_forever),
                              //icon data for elevated button
                              label: Text("ลบความคิดเห็น"),
                              //label text
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0)),
                                  minimumSize: Size(200, 40), //////// HERE
                                  primary: Colors
                                      .blueAccent //elevated btton background color
                              ),
                            ),
                          ),
                          Align(
                            //Icon(Icons.key_off_outlined),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                //print("ปักหมุดความคิดเห็น");
                              },
                              icon: Icon(Icons.error_outline),
                              //icon data for elevated button
                              label: Text("รายงาน"),
                              //label text
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0)),
                                  minimumSize: Size(200, 40), //////// HERE
                                  primary: Colors
                                      .blueAccent //elevated btton background color
                              ),
                            ),
                          ),
                          Align(
                            child: ElevatedButton(
                              child: Text('Close'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
