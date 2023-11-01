class Validator {
  static isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
        .hasMatch(password);
  }

  static bool isGenderValid(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return true;
      case 'female':
        return true;
      case 'other':
        return true;
      default:
        return false; // Invalid gender
    }
  }

  static String? validateName(String? name) {
    if (name!.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Please enter your email';
    } else if (!isEmailValid(email)) {
      return 'Email is Wrong';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Please enter your password';
    } else if (!isPasswordValid(password)) {
      return 'Password is Wrong';
    } else {
      return null;
    }
  }

  static String? validateGender(String? gender) {
    if (gender!.isEmpty) {
      return 'Please select your gender';
    } else if (!isGenderValid(gender)) {
      return 'Password is Wrong';
    } else {
      return null;
    }
  }
}
