class AutomorphicNumberModel {
  int number;

  AutomorphicNumberModel({required this.number});
  bool checkAutomorphic() {
    int square = number * number;
    String numStr = number.toString();
    String squareStr = square.toString();

    return squareStr.endsWith(numStr);
  }
}