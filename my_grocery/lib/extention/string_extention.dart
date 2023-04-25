// This is an extension on the String class, allowing for easy access to certain operations on strings.
extension ExtString on String {
  // This function capitalizes the first letter of a string and makes all other letters lowercase.
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  // This getter returns true if the string is a valid email address.
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  // This getter returns true if the string is a valid name. A valid name consists of one or more words, with each word starting with a capital letter.
  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  // This getter returns true if the string is a valid password. A valid password consists of at least 8 characters, with at least one capital letter, one lowercase letter, one number, and one special character.
  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  // This getter returns true if the string contains at least one special character.
  bool get isValidPasswordHasSpecialCharacter {
    final passwordRegExp = RegExp(r'[!@#$\><*~]');
    return passwordRegExp.hasMatch(this);
  }

  // This getter returns true if the string contains at least one capital letter.
  bool get isValidPasswordHasCapitalLetter {
    final passwordRegExp = RegExp(r'[A-Z]');
    return passwordRegExp.hasMatch(this);
  }

  // This getter returns true if the string contains at least one lowercase letter.
  bool get isValidPasswordHasLowerCaseLetter {
    final passwordRegExp = RegExp(r'[a-z]');
    return passwordRegExp.hasMatch(this);
  }

  // This getter returns true if the string contains at least one number.
  bool get isValidPasswordHasNumber {
    final passwordRegExp = RegExp(r'[0-9]');
    return passwordRegExp.hasMatch(this);
  }

  // This getter returns true if the string is a valid phone number. A valid phone number starts with a plus sign, followed by 10 digits.
  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
