import 'package:flutter/material.dart';
import 'package:study_app/study_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study App')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Show Bottom Sheet'),
              onPressed: () => showTopicBottomSheet(context),
            ),
            ElevatedButton(
              child: const Text('Show Info Bottom Sheet'),
              onPressed: () => showInfoBottomSheet(context),
            ),
          ],
        ),
      ),
    );
  }
}
