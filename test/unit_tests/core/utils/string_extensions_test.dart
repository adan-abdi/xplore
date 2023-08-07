import 'package:flutter_test/flutter_test.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';

void main() {
  /// Phone Number Validity
  group('Testing Phone number validity', () {
    group('Phone numbers starting with 0', () {
      test('Phone numbers starting with 0 and are 10 digits long are valid',
          () {
        //  setup
        final phone = '0717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });

      test(
          'Phone numbers starting with 0 and are less than 10 digits long are invalid',
          () {
        //  setup
        final phone = '071744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });

      test(
          'Phone numbers starting with 0 and are greater than 10 digits long are invalid',
          () {
        //  setup
        final phone = '07174466078';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
    });

    group('Phone numbers starting with 1', () {
      test('Phone numbers starting with 1 and are 9 digits long are valid', () {
        //  setup
        final phone = '113134534';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });

      test(
          'Phone numbers starting with 1 and are less than 9 digits long are invalid',
          () {
        //  setup
        final phone = '11313453';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });

      test(
          'Phone numbers starting with 1 and are greater than 9 digits long are invalid',
          () {
        //  setup
        final phone = '1131345344';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
    });

    group('Phone numbers starting with 7', () {
      test('Phone numbers starting with 7 and are 9 digits long are valid', () {
        //  setup
        final phone = '717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });

      test(
          'Phone numbers starting with 7 and are less than 9 digits long are invalid',
          () {
        //  setup
        final phone = '71744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });

      test(
          'Phone numbers starting with 7 and are greater than 9 digits long are invalid',
          () {
        //  setup
        final phone = '7174466070';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
    });

    group('Phone numbers starting with 254', () {
      test(
          'Phone numbers starting with 254, have a zero after 254 and are 13 digits long are valid',
          () {
        //  setup
        final phone = '2540717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test(
          'Phone numbers starting with 254, have a zero after 254 and are 12 digits long are invalid',
          () {
        //  setup
        final phone = '254071744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test(
          'Phone numbers starting with 254, have a zero after 254 and are 14 digits long are invalid',
          () {
        //  setup
        final phone = '25407174466077';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test(
          'Phone numbers starting with 254, do not have a zero after 254 and are 12 digits long are valid',
          () {
        //  setup
        final phone = '254717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test(
          'Phone numbers starting with 254, do not have a zero after 254 and are 11 digits long are invalid',
          () {
        //  setup
        final phone = '25471744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test(
          'Phone numbers starting with 254, do not have a zero after 254 and are 13 digits long are invalid',
          () {
        //  setup
        final phone = '2547174466078';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
    });

    group('Phone numbers starting with +254', () {
      test(
          'Phone numbers starting with +254, have a zero after +254 and are 14 digits long are valid',
          () {
        //  setup
        final phone = '+2540717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test(
          'Phone numbers starting with +254, have a zero after +254 and are 13 digits long are invalid',
          () {
        //  setup
        final phone = '+254071744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test(
          'Phone numbers starting with +254, have a zero after +254 and are 15 digits long are invalid',
          () {
        //  setup
        final phone = '+25407174466077';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test(
          'Phone numbers starting with +254, do not have a zero after +254 and are 13 digits long are valid',
          () {
        //  setup
        final phone = '+254717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test(
          'Phone numbers starting with +254, do not have a zero after +254 and are 12 digits long are invalid',
          () {
        //  setup
        final phone = '+25471744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test(
          'Phone numbers starting with +254, do not have a zero after +254 and are 14 digits long are invalid',
          () {
        //  setup
        final phone = '+2547174466078';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
    });
  });

  /// Add Prefix to Phone Number
  group('Add +254 Prefix to phone number', () {
    test('Add prefix to numbers starting with 7xxxx', () {
      //  setup
      final phone = '717446607';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '+254$phone');
    });
    test('Add prefix to numbers starting with 07xxxx', () {
      //  setup
      final phone = '0717446607';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '+254717446607');
    });
    test('Add prefix to numbers starting with 1xxxx', () {
      //  setup
      final phone = '113132658';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '+254$phone');
    });
    test('Add prefix to numbers starting with 01xxxx', () {
      //  setup
      final phone = '0113132658';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '+254113132658');
    });
    test('Add prefix to numbers starting with 254xxxx', () {
      //  setup
      final phone = '254717446607';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '+$phone');
    });
    test('Add prefix to numbers with leading zero and starting with 254xxxx',
        () {
      //  setup
      final phone = '2540717446607';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '+254717446607');
    });
    test('Add prefix to numbers starting with +254xxxx', () {
      //  setup
      final phone = '+254717446607';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '$phone');
    });
    test('Add prefix to numbers with leading zero and starting with +254xxxx',
        () {
      //  setup
      final phone = '+2540717446607';
      //  act
      final formattedPhone = phone.add254Prefix;
      //  assert
      expect(formattedPhone, '+254717446607');
    });
  });

  /// Trim User Name
  group('Trim User Name', () {
    test('user name with 1 word returns the word with no spaces', () {
      //  arrange
      final userName = '     Ken    ';
      //  act
      final trimmedName = userName.trimUserName;
      //  assert
      expect(trimmedName, 'Ken');
    });

    test(
        'user name with 2 words returns one word and first letter of second word',
        () {
      //  arrange
      final userName = 'Ken Starry';
      //  act
      final trimmedName = userName.trimUserName;
      //  assert
      expect(trimmedName, 'Ken S.');
    });

    test(
        'user name with 3 words returns one word and first letter of second word',
        () {
      //  arrange
      final userName = 'Ken Starry Njoroge';
      //  act
      final trimmedName = userName.trimUserName;
      //  assert
      expect(trimmedName, 'Ken S.');
    });
  });

  /// Get Store name
  group('Get Store Name from username', () {
    test('Username longer than 1 word returns first name with apostrophe s',
        () {
      //  arrange
      final username = 'Ken Starry';
      //  act
      final storeName = username.getStoreName;
      //  assert
      expect(storeName, "Ken's Store");
    });
    test('Username with 1 word returns word with apostrophe s',
            () {
          //  arrange
          final username = '  Ken       ';
          //  act
          final storeName = username.getStoreName;
          //  assert
          expect(storeName, "Ken's Store");
        });
  });

  /// Add Commas to prices
  group('Add Commas to prices', () {
    test('One digit numbers should not have any commas', () {
      final num = 1;
      final numFormatted = num.toString().addCommas;

      expect(numFormatted, '${num}');
    });
    test('Two digit numbers should not have any commas', () {
      final num = 11;
      final numFormatted = num.toString().addCommas;

      expect(numFormatted, '${num}');
    });
    test('Three digit numbers should not have any commas', () {
      final num = 111;
      final numFormatted = num.toString().addCommas;

      expect(numFormatted, '${num}');
    });
    test('four digit numbers should have one comma', () {
      final num = 1111;
      final numFormatted = num.toString().addCommas;

      expect(numFormatted, '1,111');
    });
    test('7 digit numbers should have two commas', () {
      final num = 1111111;
      final numFormatted = num.toString().addCommas;

      expect(numFormatted, '1,111,111');
    });
  });
}
