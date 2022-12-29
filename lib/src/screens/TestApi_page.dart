import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tester/tester_bloc.dart';
import '../blocs/tester/tester_event.dart';
import '../blocs/tester/tester_state.dart';
import '../data/models/test_model.dart';

class TestApi_page extends StatefulWidget {
  const TestApi_page({Key? key}) : super(key: key);

  @override
  State<TestApi_page> createState() => _TestApi_pageState();
}

class _TestApi_pageState extends State<TestApi_page> {
  final TesterBloc _newsBloc = TesterBloc();

  @override
  void initState() {
    _newsBloc.add(LoadTesterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _newsBloc,
      child: BlocBuilder<TesterBloc, TesterState>(builder: (context, state) {
        if (state is TesterLoadingState) {
          return Text("Laoding");
        } else if (state is TesterLoadedState) {
          return _buildCard(context, state.tester);
        } else {
          return Text(state.props.toString());
        }
      }),
    );
  }
}

Widget _buildCard(BuildContext context, TestModel model) {
  return ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text("Country: ${model.id}"),
              ],
            ),
          ),
        ),
      );
    },
  );
}
