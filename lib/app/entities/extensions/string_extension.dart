extension StringExtension on String {
  String capitalizeFirst(String s) {
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}
