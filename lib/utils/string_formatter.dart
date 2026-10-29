class StringFormatter {

  static String dateToString(DateTime date){
    return date.toString().substring(0, 10);
  }

  static bool stringIsEmpty(String text){
    return text.trim().isEmpty;
  }

  static String stringWithoutSpaces(String text){
    return text.trim().replaceAll(RegExp(r'\s+'), " ");
  }
}