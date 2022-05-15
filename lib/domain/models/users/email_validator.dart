
import 'package:cloud_firestore_odm/annotation.dart';

class EmailAddressValidator implements Validator<String> {
  const EmailAddressValidator();

  @override
  void validate(String value) {
    if (!value.contains("@") || !value.contains(".com")) {
      throw Exception("Email address is not valid!");
    }
  }
}
