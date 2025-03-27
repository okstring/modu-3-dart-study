import 'index.dart';

class Chirp extends Bird {
  @override
  void tweetSound() => print('🦜짹짹~');

  @override
  Future<dynamic> clearanceDuration() async => await Future.delayed(Duration(seconds: 3));
}