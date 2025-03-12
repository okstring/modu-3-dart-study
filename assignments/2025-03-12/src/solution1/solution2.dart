bool isPrime(int number) {
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  print(isPrime(7));
  print(isPrime(12));
  print(isPrime(23));
}