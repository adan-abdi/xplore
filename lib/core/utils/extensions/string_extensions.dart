import 'package:intl/intl.dart';
import 'package:shamiri/domain/value_objects/app_constants.dart';

extension StringExtensions on String {
  /// Firebase
  String get getImagePath {
    final filePath = replaceAll(
            RegExp(
                r'https://firebasestorage.googleapis.com/v0/b/dial-in-21c50.appspot.com/o/default_images%2F'),
            '')
        .split('?')[0];

    return filePath;
  }

  ///  Check whether given phone number is valid
  bool get checkIsPhoneNumberValid {
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

  ///  add +254 prefix
  String get add254Prefix {
    if (this.startsWith('1') || this.startsWith('7')) {
      return '+254$this';
    } else if (this.startsWith('0')) {
      return '+254${this.substring(1)}';
    } else if (this.startsWith('254') && this[3] == '0') {
      return '+${this.replaceFirst(RegExp('0'), '')}';
    } else if (this.startsWith('254') && this[3] != '0') {
      return '+$this';
    } else if (this.startsWith('+254') && this[4] == '0') {
      return '${this.replaceFirst(RegExp('0'), '')}';
    } else {
      return this;
    }
  }

  /// Trim User Name
  String get trimUserName {
    final words = this.trim().split(" ").toList();
    if (words.length > 1) {
      return '${words[0]} ${words[1][0]}.';
    } else {
      return words[0];
    }
  }

  /// User's store
  String get getStoreName {
    final words = this.trim().split(" ").toList();

    if (words.length > 1) {
      return "${words[0]}'s Store";
    } else {
      return "${this.trim()}'s Store";
    }
  }

  /// Add commas
  String get addCommas {
    return this.replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  String get shortenDateNames {
    if (this.length > 3) {
      return '${this[0]}${this[1]}${this[2]}';
    } else {
      return this;
    }
  }

  /// Format Date Time
  String get formatDate {
    final date = DateTime.parse(this);
    final format = DateFormat('dd/MM/yyyy');

    return format.format(date);
  }
}
