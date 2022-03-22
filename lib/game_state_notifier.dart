import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wod_combat_screen/abilities.dart';
import 'package:wod_combat_screen/character.dart';
import 'package:wod_combat_screen/main.dart';
import 'equipment.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  final Ref ref;
  GameStateNotifier(this.ref)
      : super(GameState(
            opponent: Character.humanPlayer(
                'SmallDickJohnny', CharacterEquipment(helmet, vest)),
            player: Character.vampirePlayer(
                'BuffiesBitch', CharacterEquipment(empty, vest))));

  void useAbility(Ability ability) {
    final oldOpponentHealth = state.opponent.currentHealth;
    ability.use(state.player, state.opponent);
    ref.read(logStateNotifierProvider.notifier).log(
        '${state.player.name} hits ${state.opponent.name} with ${ability.name} for ${oldOpponentHealth - state.opponent.currentHealth}');
    state = GameState(player: state.player, opponent: state.opponent);
  }
}

class GameState {
  GameState({required this.player, required this.opponent});
  final Character player;
  final Character opponent;
}
