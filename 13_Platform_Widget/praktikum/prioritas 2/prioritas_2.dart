import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Cupertino App',
      home: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color(0xFF424242),
          middle: Text(
            'CupertinoApp',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        child: Center(
          child: Text(
            'This is CupertinoApp',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
