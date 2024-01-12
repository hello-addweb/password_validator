/// Documentation
///
/// password_validator_package library collection.
library password_validator_package;

/// A PasswordValidator.
class PasswordValidator {
  PasswordValidator();

  /// Returns true , false
  /// true if password is correct and false for incorrect.
  static bool validatePassword(String password) {
    //   // regex for password that contains upper,lower,digit and Special character
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regex = RegExp(pattern);

    return regex.hasMatch(password);
  }
}
