import 'character.dart';

abstract class Ability {
  final double physicalDamage;
  final double silverDamage;
  final double healDamage;
  final double healthDrain;
  final String name;

  const Ability(this.physicalDamage, this.silverDamage, this.healDamage,
      this.healthDrain, this.name);
  void use(Character orginator, Character target);
  @override
  String toString() {
    return 'name $name\nphysicialDamage $physicalDamage\nsilverDamage $silverDamage nhealDamage $healDamage\nhealthDrain $healthDrain';
  }
}

class DamageAbility extends Ability {
  const DamageAbility(double physicalDamage, double silverDamage,
      double healDamage, double healthDrain, String name)
      : super(physicalDamage, silverDamage, healDamage, healthDrain, name);

  @override
  void use(Character orginator, Character target) {
    // TODO: implement use
    final damage = -(physicalDamage * target.race.physicalDamageModifier +
            silverDamage * target.race.silverDamageModifier)
        .round();
    target.modifyHealth(damage);
  }
}

class HealingAbility extends Ability {
  const HealingAbility(double physicalDamage, double silverDamage,
      double healDamage, double healthDrain, String name)
      : super(physicalDamage, silverDamage, healDamage, healthDrain, name);

  @override
  void use(Character orginator, Character target) {
    // TODO: implement use
    final damage = (physicalDamage * target.race.physicalDamageModifier +
            silverDamage * target.race.silverDamageModifier)
        .round();
    target.modifyHealth(damage);
  }
}

class DamageHealingAbility extends Ability {
  const DamageHealingAbility(double physicalDamage, double silverDamage,
      double healDamage, double healthDrain, String name)
      : super(physicalDamage, silverDamage, healDamage, healthDrain, name);

  @override
  void use(Character orginator, Character target) {
    // TODO: implement use
    final damage = -healthDrain.round();
    final healing = healDamage.round();
    target.modifyHealth(damage);
    orginator.modifyHealth(healing);
  }
}

const autoAttack = DamageAbility(10, 0, 0, 0, 'Auto Attack');
const claw = DamageAbility(15, 0, 0, 0, 'Claw');
const bite = DamageAbility(20, 0, 0, 0, 'Bite');
const silverShot = DamageAbility(5, 10, 0, 0, 'Silver Shot');

const healingMeds = HealingAbility(0, 0, 20, 0, 'healingMeds');
const spiritFlesh = HealingAbility(0, 0, 30, 0, 'Spirit Flesh');

const drainLife = DamageHealingAbility(0, 0, 25, 25, 'Drain Life');
