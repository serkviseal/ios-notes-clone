extension StringExtension on String {
  String shorten() {
    return this.length <= 23 ? this : this.replaceRange(23, this.length, "...");
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String charsBetween(int start, int end) {
    String result = "";
    for (int i = start; i <= end; i++) {
      result += this[i];
    }
    return result;
  }
}
