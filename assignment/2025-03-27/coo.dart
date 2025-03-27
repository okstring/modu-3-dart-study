import 'index.dart';

class Coo extends Bird {
  @override
  void tweetSound() => print('🕊️꾸우~');

  @override
  Future<dynamic> clearanceDuration() async => await Future.delayed(Duration(seconds: 1));
}