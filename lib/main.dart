import 'package:flutter/material.dart';

import 'src/ui/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'space',
      theme: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
                  title: TextStyle(color: Colors.black),
                ),
            cardColor: Colors.white,
          ),
      home: HomeScreen(),
    );
  }
}
