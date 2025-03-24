import 'task_exception.dart';

class Word {
  static final Set<String> vowels = <String>{
    'a',
    'e',
    'i',
    'o',
    'u',
    'A',
    'E',
    'I',
    'O',
    'U',
  };
  String word;

  Word({required this.word});

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) {
      throw TaskException.invalidIndex;
    } else {
      return vowels.contains(word[i]);
    }
  }

  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) {
      throw TaskException.invalidIndex;
    }

    final character = word[i];
    final codeUnit = character.codeUnits[0];

    if (codeUnit >= 65 && codeUnit <= 90 && codeUnit >= 97 && codeUnit <= 122) {
      return !isVowel(i);
    } else {
      throw TaskException.invalidCharactor;
    }
  }
}
