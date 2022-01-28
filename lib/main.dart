import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Text('boop'))),
          Expanded(child: Center(child: Text('boop'))),
          Expanded(child: Center(child: Text('boop'))),
          Expanded(
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),Expanded(
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),Expanded(
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
