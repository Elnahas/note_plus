import 'package:intl/intl.dart';

bool isSeenOnboarding = false;
const kNotesBox = "notes_box";
class SharedPrefKeys {
  static const String hasSeenOnboarding = 'hasSeenOnboarding';
}

  String getFormattedDate(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  String getFormattedTime(DateTime dateTime) {
    return DateFormat("hh:mm a").format(dateTime);
  }