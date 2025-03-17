void main() {
  Set<int> lottoSet = {2, 3};
  lottoSet.add(1);
  lottoSet.add(4);
  lottoSet.add(2);  // 중복 안 됨
  lottoSet.remove(3);
  lottoSet.remove(3);

  print(lottoSet.contains(3));
  print(lottoSet);


  List<String> names = [
    '홍길동',
    '한석봉',
  ];

  print(names.contains('홍길동'));

  // index 를 활용한 뺑뺑이
  for (int i = 0; i < names.length; i++) {
    print('${i + 1} : ${names[i]}');
  }

  // 무지성 뺑뺑이
  for (final name in names) {
    print(name);
  }

  // 일단 금지
  names.forEach((String name) {
    print(name);
  });

  // 함수의 입력, 출력 타입이 동일한 경우
  names.forEach(print);

  // names.add('신사임당');
  // names.remove('홍길동');
  //
  // print(names);
  //
  // names.removeAt(0);
  // print(names);

  // 객체 표현
  Map<String, dynamic> gildong = {
    'age': 20,
    'name': '한성봉',
  };

  print(gildong);
  print(gildong['name']);
  print(gildong['age']);

  // dynamic 모든 타입이 가능
  final String name = gildong['name'];    // 강제 타입 캐스팅
  int age = gildong['age'];

  final name2 = gildong['name'] as String;  // 강제 타입 캐스팅

  // 이렇게 쓰는 거 아님
  final age3 = gildong['age'].toString();
  print('20');


  gildong.entries.forEach((e) {
    print(e);
  });
}