void main() {
  Hero2 hero2 = Hero2(name: 'name', healPoint: 100);
  print(hero2.hp);

  hero2.hp = 200;
  print(hero2.hp);

}

class Hero2 {
  String name;    // property, field, member
  int _hp;

  int get hp => _hp;  // property

  set hp(int value) {   // property
    if (value < 0) {
      throw Exception('hp 는 0 보다 작을 수 없습니다');
    }
    _hp = value;
  }

  // getter
  // int get hp => _hp;

  Hero2({required this.name, required int healPoint}) : _hp = healPoint;
}