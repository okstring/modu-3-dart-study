import 'index.dart';

class Caw extends Bird {
  @override
  void tweetSound() => print('🐦‍⬛까악~');

  @override
  Future<dynamic> clearanceDuration() async => await Future.delayed(Duration(seconds: 2));
}