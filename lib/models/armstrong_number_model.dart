class ArmstrongNumberModel {
  int number;
  ArmstrongNumberModel({required this.number});

  bool isArmstrong() {
    int sum = 0;
    int temp = number;
    // int digit = number.toString().length;

    while (temp > 0) {
      int digit = temp % 10;
      sum += digit * digit * digit; // For 3-digit numbers
      temp ~/= 10;
    }

    return sum == number;
  }
}