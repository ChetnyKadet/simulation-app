class CharacterEquipment {
  Equipment head;
  Equipment chest;
  CharacterEquipment(this.head, this.chest);

  int get stamina => this.head.stamina + this.chest.stamina;
}

class Equipment {
  int stamina;
  Equipment(this.stamina);
}

final helmet = Equipment(10);
final vest = Equipment(10);
final empty = Equipment(0);
