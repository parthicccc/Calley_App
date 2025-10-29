class Validators {
  Validators._();

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Enter valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 3) {
      return 'Password too short';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter mobile number';
    }
    if (value.length != 10) {
      return 'Enter 10-digit number';
    }
    return null;
  }
}