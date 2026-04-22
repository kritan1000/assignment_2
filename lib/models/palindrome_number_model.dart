class PalindromeModel {
  int number;

  PalindromeModel({required this.number});

  bool isPalindrome() {
    if (number < 0) {
      return false;
    }
    String str = number.toString();
    String reversedStr = str.split('').reversed.join('');
    return str == reversedStr;
  }
}