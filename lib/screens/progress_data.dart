
class DiaryEntry {
  String reflection;
  DateTime date;

  DiaryEntry({
    required this.reflection,
    required this.date,
  });
}

class ProgressData {
  static int streakDays = 0;
  static int totalCheckIns = 0;
  static bool checkedInToday = false;

  // Store all diary entries
  static List<DiaryEntry> diaryEntries = [];

  static void completeCheckIn() {
    if (checkedInToday) return;

    streakDays++;
    totalCheckIns++;
    checkedInToday = true;
  }
}
