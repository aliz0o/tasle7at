class Validation {
  bool isValidPhoneNumber(String string) {
    // Null or empty string is invalid phone number
    if (string == null || string.isEmpty) {
      return false;
    }
    //jordanian phone number RegExp (0780122384)
    const pattern = r'^([0][7][7-9]{1}[0-9]{7})$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }
}
