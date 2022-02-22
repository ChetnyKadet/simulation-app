import 'dart:ui';

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

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                  child: Align(
                child: PlayerWidget(
                  title: 'Opponent',
                  imageAsset: 'assets/nerd.jpeg',
                  bars: OpponentBars(
                    healthPoints: 0.7,
                  ),
                ),
                alignment: Alignment.centerLeft,
              )),
              Expanded(child:CombatLog()),
              const Expanded(
                  child: Align(
                child: PlayerWidget(
                    title: 'Player',
                    imageAsset: 'assets/vampire.jpeg',
                    bars: PlayerBars(
                      healthPoints: 0.3,
                      manaPoints: 0.7,
                      energyPoints: 0.2,
                    )),
                alignment: Alignment.centerLeft,
              )),
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
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  final String title;
  final String imageAsset;
  final Widget bars;

  const PlayerWidget(
      {Key? key,
      required this.title,
      required this.imageAsset,
      required this.bars})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              height: 160,
            ),
            bars
          ],
        ),
      ],
    );
  }
}

class PlayerBars extends StatelessWidget {
  final double healthPoints;
  final double manaPoints;
  final double energyPoints;
  const PlayerBars(
      {Key? key,
      required this.healthPoints,
      required this.manaPoints,
      required this.energyPoints})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: LinearProgressIndicator(
              value: healthPoints,
              minHeight: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: LinearProgressIndicator(
              value: manaPoints,
              minHeight: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: LinearProgressIndicator(
              value: energyPoints,
              minHeight: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class OpponentBars extends StatelessWidget {
  final double healthPoints;

  const OpponentBars({
    Key? key,
    required this.healthPoints,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          LinearProgressIndicator(
            minHeight: 15,
            value: healthPoints,
          )
        ],
      ),
    );
  }
}

class CombatLog extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center,

    children: const [Text('Yay a button!',style: TextStyle(fontSize: 18),)],);
  }
}
