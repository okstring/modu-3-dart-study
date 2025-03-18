
import '../2025-03-17/wizard.dart';
import 'hero.dart';

class GreatWizard extends Wizard {
  static const hasNoMpMsg = '마나가 부족합니다';
  static superHealMsg(int hp) => '슈퍼힐을 시전했습니다. 대상 HP: $hp';
  GreatWizard(super.name, super.hp, {super.wand}) {
    super.mp = 150;
  }

  void superHeal(Hero hero) {
    if (mp < 50) {
      print(hasNoMpMsg);
    } else {
      hero.hp = Hero.maxHp;
      print(superHealMsg(hero.hp));
    }
  }
}