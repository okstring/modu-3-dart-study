abstract class Bird {
  void tweetSound();
  Future<dynamic> clearanceDuration();

  Future<void> tweet(int count) async {
    for (int i = 0; i < count; i++) {
      tweetSound();
      await clearanceDuration();
    }
  }
}