import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wod_combat_screen/abilities.dart';
import 'package:wod_combat_screen/character.dart';
import 'equipment.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier()
      : super(GameState(
            opponent: Character.humanPlayer(
                'SmallDickJohnny', CharacterEquipment(helmet, vest)),
            player: Character.vampirePlayer(
                'BuffiesBitch', CharacterEquipment(empty, vest))));

  void useAbility(Ability ability) {
    ability.use(state.player, state.opponent);
    state = GameState(player: state.player, opponent: state.opponent);
  }
}

class GameState {
  GameState({required this.player, required this.opponent});
  final Character player;
  final Character opponent;
}
