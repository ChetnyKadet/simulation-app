import 'equipment.dart';
import 'stats.dart';
import 'race.dart';
import 'abilities.dart';

class Character {
  static final int minHealth = 0;
  static final int baseHealth = 100;
  final String name;
  int get maxHealth =>
      (baseHealth * race.healthModifier).round() +
      characterEquipment.stamina * 10;
  int currentHealth = 100;
  bool isDead = false;
  final Race race;
  final List<Ability> spellbook;
  final CharacterEquipment characterEquipment;

  Character.humanPlayer(String name, CharacterEquipment characterEquipment)
      : this.race = human,
        this.name = name,
        this.characterEquipment = characterEquipment,
        this.spellbook = [autoAttack, silverShot, healingMeds],
        this.currentHealth = (baseHealth * human.healthModifier).round() +
            characterEquipment.stamina * 10;

  Character.vampirePlayer(String name, CharacterEquipment characterEquipment)
      : this.race = vampire,
        this.name = name,
        this.characterEquipment = characterEquipment,
        this.spellbook = [autoAttack, claw, silverShot, drainLife],
        this.currentHealth = (baseHealth * vampire.healthModifier).round() +
            characterEquipment.stamina * 10;

  Character.werewolfPlayer(String name, CharacterEquipment characterEquipment)
      : this.race = werewolf,
        this.name = name,
        this.characterEquipment = characterEquipment,
        this.spellbook = [autoAttack, claw, bite, silverShot, spiritFlesh],
        this.currentHealth = (baseHealth * werewolf.healthModifier).round() +
            characterEquipment.stamina * 10;

  void modifyHealth(int amount) {
    currentHealth += amount;
    if (currentHealth > maxHealth) {
      currentHealth = maxHealth;
    }
    if (currentHealth <= minHealth) {
      currentHealth = minHealth;
      isDead = true;
    }
  }

  void useAbility(Ability ability, Character character) {
    ability.use(this, character);
    print('Attacker: ${this.toString()}');
    print('Target: ${character.toString()}');
  }

  @override
  String toString() {
    return 'name $name\nmaxHealth$maxHealth\ncurrentHealth $currentHealth\nisDead $isDead\nrace $race';
  }
}
