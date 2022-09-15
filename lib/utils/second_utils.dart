class SecondUtils {
  SecondUtils._();

  static String listToHashtag(List<String> data) {
    data.sort((a, b) => a.compareTo(b));
    String val = '';
    for (var element in data) {
      if (element == '') continue;
      val += '#${element.trim()} ';
    }
    return val;
  }
}
