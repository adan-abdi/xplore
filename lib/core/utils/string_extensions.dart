extension StringExtensions on String {

  //  Check whether given phone number is valid
  bool checkIsPhoneNumberValid() {
    final startWith7 = startsWith('7');
    final startWith0 = startsWith('0');
    final startWith1 = startsWith('1');
    final startWith254 = startsWith('254');
    final startWithPlus254 = startsWith('+254');

    if (((startWith7 || startWith1) && length == 9) ||
        (startWith0 && length == 10) ||
        (startWith254 && this[3] == 0.toString() && length == 13) ||
        (startWith254 && this[3] != 0.toString() && length == 12) ||
        (startWithPlus254 && this[4] == 0.toString() && length == 14) ||
        (startWithPlus254 && this[4] != 0.toString() && length == 13)) {
      return true;
    } else {
      return false;
    }
  }
}
