import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/screens/Setting/Setting_account.dart';

import '../../blocs/authentication/authen_bloc.dart';
import '../../blocs/authentication/authen_event.dart';
import '../autheentication/SignIn.dart';
import 'Setting_notification.dart';

class Setting_setting extends StatefulWidget {
  const Setting_setting({Key? key}) : super(key: key);

  @override
  State<Setting_setting> createState() => _Setting_settingState();
}

class _Setting_settingState extends State<Setting_setting> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "การตั้งค่า",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Setting_notification()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text("การแจ้งเตือน", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
            ),
            // Divider(height: 20, thickness: 1),
            // SizedBox(height: 10),
            // buildAccountOption(context,"Change  Password"),
            // buildAccountOption(context,"Content Settings"),
            // buildAccountOption(context,"Social"),
            SizedBox(height: 40),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Setting_account()));
                },
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text("บัญชี", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )),
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.support,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text("ติดต่อแอดมิน", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.report,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text("เกี่ยวกับการตั้งค่า", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            // buildNotificationOption("Theme Dark", valNotify1, onChangeFunction1),
            // buildNotificationOption("Account Active", valNotify2, onChangeFunction2),
            // buildNotificationOption("Opportunity", valNotify3, onChangeFunction3),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                child: Text(
                  "ออกจากระบบ",
                  style: TextStyle(
                      fontSize: 16, letterSpacing: 2.2, color: Colors.red),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (context) => Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            child:
                                Text("คุณแน่ใจหรือไม่ว่าคุณต้องการออกจากระบบ"),
                          ),
                          SizedBox(height: 20),
                          Divider(height: 20, thickness: 1),
                          Align(
                            //Icon(Icons.key_off_outlined),
                            child: BlocProvider<AuthenticationBloc>(
                              create: (_) => AuthenticationBloc(),
                              child: BlocListener<AuthenticationBloc,
                                  AuthenticationState>(
                                listener: (BuildContext context, state) {
                                  if (state is SignOutSuccess) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn()), (r) {
                                      return false;
                                    });
                                  }
                                },
                                child: BlocBuilder<AuthenticationBloc,
                                        AuthenticationState>(
                                    builder: (context, state) {
                                  return TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.deepOrangeAccent),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<AuthenticationBloc>()
                                          .add(SignOut());
                                    },
                                    child: Text('ออกจากระบบ'),
                                  );
                                }),
                              ),
                            ),
                          ),
                          Divider(height: 20, thickness: 1),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            onPressed: () {},
                            child: Text('ยกเลิก'),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Text("Option 1"), Text("Option 2")],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
