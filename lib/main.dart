import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wod_combat_screen/game_state_notifier.dart';
import 'package:wod_combat_screen/log_state_notifier.dart';

import 'character.dart';
import 'equipment.dart';

final opponentTitleProvider = Provider((_) => 'Opponent');
final playerTitleProvider = Provider((_) => 'Player');

/*final opponentProvider = Provider((_) =>
    Character.humanPlayer('SmallDickJohnny', CharacterEquipment(helmet, vest)));
final playerProvider = Provider((_) =>
    Character.vampirePlayer('BuffiesBitch', CharacterEquipment(empty, vest)));*/

final gameStateNotifierProvider =
    StateNotifierProvider<GameStateNotifier, GameState>(
        (ref) => GameStateNotifier(ref));

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const ProviderScope(child: MyApp()));
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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*final opponent = ref.watch(opponentProvider);
    final player = ref.watch(playerProvider);*/
    final gameState = ref.watch(gameStateNotifierProvider);
    final gameStateNotifier = ref.watch(gameStateNotifierProvider.notifier);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Align(
                child: PlayerWidget(
                  title: ref.watch(opponentTitleProvider),
                  imageAsset: 'assets/nerd.jpeg',
                  bars: OpponentBars(
                    healthPoints: gameState.opponent.currentHealth /
                        gameState.opponent.maxHealth,
                  ),
                ),
                alignment: Alignment.centerLeft,
              )),
              Expanded(child: CombatLog()),
              Expanded(
                  child: Align(
                child: PlayerWidget(
                    title: ref.watch(playerTitleProvider),
                    imageAsset: 'assets/vampire.jpeg',
                    bars: PlayerBars(
                      healthPoints: gameState.player.currentHealth /
                          gameState.player.maxHealth,
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
                            onPressed: () {
                              gameStateNotifier
                                  .useAbility(gameState.player.spellbook[0]);
                            },
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              gameStateNotifier
                                  .useAbility(gameState.player.spellbook[1]);
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              gameStateNotifier
                                  .useAbility(gameState.player.spellbook[2]);
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              gameStateNotifier
                                  .useAbility(gameState.player.spellbook[3]);
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              gameStateNotifier
                                  .useAbility(gameState.player.spellbook[4]);
                            },
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

final logStateNotifierProvider =
    StateNotifierProvider<LogStateNotifier, List<String>>((_) {
  return LogStateNotifier();
});

class CombatLog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final log = ref.watch(logStateNotifierProvider);
    return ListView.builder(
      itemCount: log.length,
      itemBuilder: (context, index) {
        return Text(
          log[index],
          style: const TextStyle(fontSize: 18),
        );
      },
    );
  }
}
