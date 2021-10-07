import 'package:bloc_example/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ActionBloc(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context
                      .read<ActionBloc>()
                      .add(Action1(_textEditingController.text)),
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => context
                      .read<ActionBloc>()
                      .add(Action2(_textEditingController.text)),
                  child: const Text('2'),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context
                      .read<ActionBloc>()
                      .add(Action3(_textEditingController.text)),
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => context
                      .read<ActionBloc>()
                      .add(Action4(_textEditingController.text)),
                  child: const Text('4'),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<ActionBloc, String>(
              builder: (context, value) {
                return Text(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
