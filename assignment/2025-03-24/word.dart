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
    if (_isOutOfRange(index)) {
      throw TaskException.invalidIndex;
    } else {
      return vowels.contains(word[index]);
    }
  }

  bool isConsonant(int index) {
    if (_isOutOfRange(index)) {
      throw TaskException.invalidIndex;
    }

    final character = word[index];

    if (_isAlphabel(character)) {
      return !isVowel(index);
    } else {
      throw TaskException.invalidCharacter;
    }
  }

  bool _isOutOfRange(int i) {
    return i < 0 || i >= word.length;
  }

  bool _isAlphabel(String character) {
    final codeUnit = character.codeUnits[0];
    return ((codeUnit >= 65 && codeUnit <= 90) ||
        (codeUnit >= 97 && codeUnit <= 122));
  }
}
