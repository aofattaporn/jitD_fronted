import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';

import '../../blocs/authentication/authen_bloc.dart';
import '../../blocs/authentication/authen_event.dart';
import '../../blocs/authentication/authen_state.dart';
import '../autheentication/SignIn.dart';

class Setting_logout extends StatefulWidget {
  const Setting_logout({Key? key}) : super(key: key);

  @override
  State<Setting_logout> createState() => _Setting_logoutState();
}

class _Setting_logoutState extends State<Setting_logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "ออกจากระบบ",
          style: TextStyle(
              fontSize: 16, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
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
            Align(
              child: BlocProvider<AuthenticationBloc>(
                create: (_) => AuthenticationBloc(),
                child: BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (BuildContext context, state) {
                    if (state is SignOutSuccess) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()), (r) {
                        return false;
                      });
                    }
                  },
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                    return ElevatedButton(
                      child: Text("ออกจากระบบ"),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (context) => Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Align(
                                  child: Text(
                                    "คุณแน่ใจหรือไม่ว่าคุณต้องการออกจากระบบ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 180, 77)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Divider(height: 20, thickness: 1),
                                Align(
                                    //Icon(Icons.key_off_outlined),
                                    child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepOrangeAccent),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<AuthenticationBloc>()
                                        .add(SignOut());
                                    print("signOut");
                                  },
                                  child: Text('ออกจากระบบ'),
                                )),
                                Divider(height: 20, thickness: 1),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('ยกเลิก'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
