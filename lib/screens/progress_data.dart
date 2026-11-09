
class ProgressData {
  static int streakDays = 0;
  static int totalCheckIns = 0;
  static bool checkedInToday = false;

  static void completeCheckIn() {
    if (checkedInToday) return;

    streakDays++;
    totalCheckIns++;
    checkedInToday = true;
  }
}
