class ValidationUtils {
  static String emailValidator(String arg) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    return !regex.hasMatch(arg) ? 'Please enter valid Email' : null;
  }

  static String textInputValidator(String arg, String label) {
    return arg.isEmpty ? 'Please enter $label' : null;
  }
}
