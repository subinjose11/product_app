class Utils {
  String formatDateFromIso(String isoDateString) {
    try {

      final DateTime dateTime = DateTime.parse(isoDateString);

      final String day = dateTime.day.toString();

      final List<String> months = [
        'jan',
        'feb',
        'mar',
        'apr',
        'may',
        'jun',
        'jul',
        'aug',
        'sep',
        'oct',
        'nov',
        'dec'
      ];
      final String month = months[dateTime.month - 1];

      final String year = dateTime.year.toString();

      return '$day $month $year';
    } catch (e) {
      return 'Invalid date format';
    }
  }
}
