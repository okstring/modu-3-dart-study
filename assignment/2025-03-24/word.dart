import 'index.dart';

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

  bool isVowel(int index) {
    if (index < 0 || index >= word.length) {
      throw TaskException.invalidIndex;
    } else {
      return vowels.contains(word[index]);
    }
  }

  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) {
      throw TaskException.invalidIndex;
    }

    final character = word[i];

    if (_isAlphabel(character)) {
      return !isVowel(i);
    } else {
      throw TaskException.invalidCharactor;
    }
  }

  bool _isAlphabel(String character) {
    final codeUnit = character.codeUnits[0];
    return ((codeUnit >= 65 && codeUnit <= 90) ||
        (codeUnit >= 97 && codeUnit <= 122));
  }
}
