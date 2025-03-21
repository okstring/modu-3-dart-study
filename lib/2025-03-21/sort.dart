import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/game/cleric.dart';

void main() {
  List<String> names = [
    '홍길동',
    '김삿갓',
    '신사임당',
  ];

  // 오름차순 정렬하여 복사본 리턴 (원본은 그대로 있음)
  // Comparator 함수 정의
  List<String> ascendingSortedNames = names.sorted((a, b) => a.compareTo(b));
  print(ascendingSortedNames);

  // 내림차순 정렬
  List<String> descendingSortedNames = names.sorted((a, b) => b.compareTo(a) * -1);
  print('원본 : $names');
  print('내림차순 : $descendingSortedNames');


  // 원본을 훼손하니까 쓰기가 더럽다
  // names.sort((a, b) => a.compareTo(b) * -1);
  print(names);


  List<int> numbers = [1, 3, 2];

  // numbers.sort();
  numbers.sort((a, b) => a.compareTo(b) * -1);

  // numbers.sort((a, b) {
  //   if (a == b) {
  //     return 0;
  //   }
  //   if (a < b) {
  //     return 1;
  //   }
  //   return -1;
  // });

  print(numbers);

  List<Cleric> clericList = [
    Cleric('홍길동'),
    Cleric('김삿갓'),
    Cleric('신사임당'),
  ];

  // List<Cleric> ascendingSortedByNameClericList = clericList.sorted((a, b) => a.name.compareTo(b.name));

  // 오름차순 정렬 짧게 이렇게도 가능
  List<Cleric> ascendingSortedByNameClericList = clericList.sortedBy((cleric) => cleric.name);

  clericList.sort();
  print(clericList);
}