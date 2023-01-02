import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/constant.dart';

import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            BlocBuilder<CounterBloc2, int>(
              builder: (context, count) => Column(
                children: [
                  Center(child: Text('$count')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                            heroTag: "button2",
                            onPressed: () => {
                                  context
                                      .read<CounterBloc2>()
                                      .add(CounterIncrementPressed())
                                },
                            backgroundColor: primaryColor,
                            child: const Icon(Icons.add)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                            heroTag: "btn3",
                            onPressed: () {
                              context
                                  .read<CounterBloc2>()
                                  .add(CounterDecrementPressed());
                            },
                            backgroundColor: primaryColor,
                            child: const Icon(Icons.delete)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                            heroTag: "btn4",
                            onPressed: () {
                              context
                                  .read<CounterBloc2>()
                                  .add(CounterResetPressed());
                            },
                            backgroundColor: primaryColor,
                            child: const Icon(Icons.reset_tv_rounded)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Text( count.toString() , style: TextStyle(color: kPrimaryColor, fontSize: 40, fontWeight: FontWeight.bold)),
          ],
        ),
      )),
    );
  }
}
