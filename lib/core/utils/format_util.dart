class FormatUtil {
  String getSymbol(String symbol) {
    String modifiedString = symbol;
    List<String> remove = ['^', '.JK', '-'];
    for (var e in remove) {
      modifiedString = modifiedString.replaceAll(e, '');
    }

    return modifiedString;
  }
}
