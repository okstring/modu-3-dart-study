void main() {
  List<int> numbers = [80, 1, 2, 3, 42];

  print(f(numbers));

  print(numbers.contains(42));
  print(numbers.where((e) => e <= 42).any((e) => e == 42));

  numbers.forEach((e) {

  });
}

bool f(List<int> list) {
  for (var i in list) {
    if (i == 42) {
      return true;
    }
  }
  return false;
}

// bool g(List<int> list) {
//   // 전체 순환하면서 뭔가하고 끝
//   // 뭔가 순수한 행동
//   // if 를 넣으면 안 돼 =>
//   list.forEach((i) {
//     if (i == 42) {
//       return true;
//     }
//   });
//   return false;
// }