<<<<<<< HEAD
import '../2025-03-17/wizard.dart';
import 'hero.dart';

class GreatWizard extends Wizard {
  static const hasNoMpMsg = '마나가 부족합니다';
  static const maxMp = 150;
  static const superHealCost = 50;

  static superHealMsg(int hp) => '슈퍼힐을 시전했습니다. 대상 HP: $hp';

  GreatWizard(super.name, super.hp, {super.mp = maxMp, super.wand});

  void superHeal(Hero hero) {
    if (mp < superHealCost) {
      print(hasNoMpMsg);
    } else {
      hero.hp = Hero.maxHp;
      mp -= superHealCost;
      print(superHealMsg(hero.hp));
    }
  }
}

main() {}
=======
import 'wizard.dart';

import '../game/hero.dart';

class GreatWizard extends Wizard {
  static const int defaultMp = 150;
  static const int superHealUseMp = 50;

  GreatWizard({required super.name, required super.hp, super.mp = defaultMp});

  void superHeal(Hero hero) {
    if (mp < superHealUseMp) {
      print('마나가 부족합니다.');
      return;
    }

    hero.hp = Hero.maxHp;
    mp -= superHealUseMp;

    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}
>>>>>>> upstream/master
