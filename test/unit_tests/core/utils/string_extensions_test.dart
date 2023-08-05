import 'package:flutter_test/flutter_test.dart';
import 'package:shamiri/core/utils/string_extensions.dart';

void main() {

  /// Phone Number Validity
  group('Testing Phone number validity', () {

    group('Phone numbers starting with 0', () {
      test('Phone numbers starting with 0 and are 10 digits long are valid', () {
        //  setup
        final phone = '0717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });

      test('Phone numbers starting with 0 and are less than 10 digits long are invalid', () {
        //  setup
        final phone = '071744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });

      test('Phone numbers starting with 0 and are greater than 10 digits long are invalid', () {
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

      test('Phone numbers starting with 1 and are less than 9 digits long are invalid', () {
        //  setup
        final phone = '11313453';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });

      test('Phone numbers starting with 1 and are greater than 9 digits long are invalid', () {
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

      test('Phone numbers starting with 7 and are less than 9 digits long are invalid', () {
        //  setup
        final phone = '71744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });

      test('Phone numbers starting with 7 and are greater than 9 digits long are invalid', () {
        //  setup
        final phone = '7174466070';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
    });

    group('Phone numbers starting with 254', () {

      test('Phone numbers starting with 254, have a zero after 254 and are 13 digits long are valid', () {
        //  setup
        final phone = '2540717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test('Phone numbers starting with 254, have a zero after 254 and are 12 digits long are invalid', () {
        //  setup
        final phone = '254071744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test('Phone numbers starting with 254, have a zero after 254 and are 14 digits long are invalid', () {
        //  setup
        final phone = '25407174466077';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test('Phone numbers starting with 254, do not have a zero after 254 and are 12 digits long are valid', () {
        //  setup
        final phone = '254717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test('Phone numbers starting with 254, do not have a zero after 254 and are 11 digits long are invalid', () {
        //  setup
        final phone = '25471744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test('Phone numbers starting with 254, do not have a zero after 254 and are 13 digits long are invalid', () {
        //  setup
        final phone = '2547174466078';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });

    });

    group('Phone numbers starting with +254', () {
      test('Phone numbers starting with +254, have a zero after +254 and are 14 digits long are valid', () {
        //  setup
        final phone = '+2540717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test('Phone numbers starting with +254, have a zero after +254 and are 13 digits long are invalid', () {
        //  setup
        final phone = '+254071744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test('Phone numbers starting with +254, have a zero after +254 and are 15 digits long are invalid', () {
        //  setup
        final phone = '+25407174466077';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test('Phone numbers starting with +254, do not have a zero after +254 and are 13 digits long are valid', () {
        //  setup
        final phone = '+254717446607';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, true);
      });
      test('Phone numbers starting with +254, do not have a zero after +254 and are 12 digits long are invalid', () {
        //  setup
        final phone = '+25471744660';
        //  act
        final isValid = phone.checkIsPhoneNumberValid;
        //  assert
        expect(isValid, false);
      });
      test('Phone numbers starting with +254, do not have a zero after +254 and are 14 digits long are invalid', () {
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
  group('+254 Prefix to phone number', () {

  });
}
