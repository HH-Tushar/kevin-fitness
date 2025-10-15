dateFormatter(DateTime date) {
  return "${date.year}-${date.month}-${date.day}";
}

class CommonValidator {
  static String? fieldRequired(String? val) {
    if (val == null || val.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? positiveNumberRequired(String? val) {
    if (val == null) {
      return "This field is required";
    }

    int? data = int.tryParse(val);
    if (data == null) {
      return "please enter valid number";
    }
    if (data < 1) {
      return "Number must be greater than 1";
    }
    return null;
  }
}
