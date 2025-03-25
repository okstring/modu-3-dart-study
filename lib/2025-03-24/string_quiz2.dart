void main() {
  String greeting = 'Hello';

  print(greeting.replaceAll('H', 'J'));
  print(greeting);

  Rectangle box1 = Rectangle(5, 10, 60, 90);
  Rectangle box2 = box1;
  box1.translate(100, 100);

  print(box1.x);
  print(box2.x);

  int luckyNumber1 = 13;  // const
  int luckyNumber2 = luckyNumber1;
  luckyNumber2 = 12;  // const

  print(luckyNumber1);  // 13
  print(luckyNumber2);  // 12
}

class Rectangle {
  int x;
  int y;
  int width;
  int height;

  Rectangle(this.x, this.y, this.width, this.height);

  void translate(int dx, int dy) {

    x += dx;
    y += dy;
  }
}