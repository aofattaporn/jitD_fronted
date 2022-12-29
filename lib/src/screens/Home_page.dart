import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';
import '../constant/Constant_Color.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

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
                          color: kPrimaryColor,
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
                              padding: EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                  onPressed: () => {
                                    context
                                        .read<CounterBloc2>()
                                        .add(CounterIncrementPressed())
                                  },
                                  backgroundColor: kPrimaryColor,
                                  child: Icon(Icons.add)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                  onPressed: () {
                                    context
                                        .read<CounterBloc2>()
                                        .add(CounterDecrementPressed());
                                  },
                                  backgroundColor: kPrimaryColor,
                                  child: Icon(Icons.delete)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                  onPressed: () {
                                    context
                                        .read<CounterBloc2>()
                                        .add(CounterResetPressed());
                                  },
                                  backgroundColor: kPrimaryColor,
                                  child: Icon(Icons.reset_tv_rounded)),
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
