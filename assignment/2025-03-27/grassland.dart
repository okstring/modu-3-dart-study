import 'index.dart';

class Grassland {
  final List<Bird> birds;

  Grassland({required this.birds});

  Future<void> tweetFourthTogether() async {
    final List<Future<void>> futures = [];

    for (final bird in birds) {
      final tweet = bird.tweet(4);
      futures.add(tweet);
    }

    await Future.wait(futures);
  }
}