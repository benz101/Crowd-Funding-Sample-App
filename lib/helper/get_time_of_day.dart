String get getTimeOfDay {
  final currentTime = DateTime.now();
  final hour = currentTime.hour;

  if (hour >= 5 && hour < 12) {
    return 'Selamat Pagi';
  } else if (hour >= 12 && hour < 17) {
    return 'Selamat Siang';
  } else if (hour >= 17 && hour < 20) {
    return 'Selamat Sore';
  } else {
    return 'Selamat Malam';
  }
}
