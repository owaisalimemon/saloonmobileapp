class Validation {
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool isPhone(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);

    return regExp.hasMatch(pattern);
  }

  bool fullNameValidate(String fullName) {
    var namePattern = r"(^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$)";
    RegExp nameRegex = RegExp(namePattern, caseSensitive: false);

    return nameRegex.hasMatch(fullName.trim());
  }

  bool validateMobile(String value) {
    String pattern = '[0-9]{7,25}';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
