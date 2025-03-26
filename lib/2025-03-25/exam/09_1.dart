void main() {
  final String numString = '10.5';

  int num = int.tryParse(numString) ?? 0;
  // try {
  //   num = int.parse(numString);
  // } catch (e) {
  //   num = 0;
  // }

  print(num);
}