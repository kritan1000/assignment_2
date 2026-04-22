class EvenOddModel {
  int number;
  EvenOddModel({required this.number});

  bool isEven() {
    return number % 2 == 0;
  }
}