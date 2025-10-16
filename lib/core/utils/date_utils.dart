import 'package:intl/intl.dart';

/// Utility class cho xử lý ngày tháng
class DateUtils {
  /// Format ngày tháng theo định dạng Việt Nam
  static String formatVietnameseDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Format ngày tháng với giờ theo định dạng Việt Nam
  static String formatVietnameseDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

  /// Format ngày tháng theo định dạng ISO
  static String formatISODate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Format ngày tháng với giờ theo định dạng ISO
  static String formatISODateTime(DateTime date) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(date);
  }

  /// Parse string thành DateTime
  static DateTime? parseDate(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Parse string theo format cụ thể
  static DateTime? parseDateWithFormat(String dateString, String format) {
    try {
      return DateFormat(format).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Lấy ngày hiện tại
  static DateTime now() {
    return DateTime.now();
  }

  /// Lấy ngày đầu tháng
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// Lấy ngày cuối tháng
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }

  /// Lấy ngày đầu tuần (Thứ 2)
  static DateTime startOfWeek(DateTime date) {
    final weekday = date.weekday;
    return date.subtract(Duration(days: weekday - 1));
  }

  /// Lấy ngày cuối tuần (Chủ nhật)
  static DateTime endOfWeek(DateTime date) {
    final weekday = date.weekday;
    return date.add(Duration(days: 7 - weekday));
  }

  /// Kiểm tra xem ngày có phải hôm nay không
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Kiểm tra xem ngày có phải hôm qua không
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// Kiểm tra xem ngày có phải ngày mai không
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  /// Tính số ngày giữa hai ngày
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return to.difference(from).inDays;
  }

  /// Tính số giờ giữa hai ngày
  static int hoursBetween(DateTime from, DateTime to) {
    return to.difference(from).inHours;
  }

  /// Tính số phút giữa hai ngày
  static int minutesBetween(DateTime from, DateTime to) {
    return to.difference(from).inMinutes;
  }

  /// Format thời gian tương đối (ví dụ: "2 giờ trước")
  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} phút trước';
    } else {
      return 'Vừa xong';
    }
  }

  /// Lấy tên tháng bằng tiếng Việt
  static String getVietnameseMonthName(int month) {
    const months = [
      'Tháng 1',
      'Tháng 2',
      'Tháng 3',
      'Tháng 4',
      'Tháng 5',
      'Tháng 6',
      'Tháng 7',
      'Tháng 8',
      'Tháng 9',
      'Tháng 10',
      'Tháng 11',
      'Tháng 12'
    ];
    return months[month - 1];
  }

  /// Lấy tên thứ bằng tiếng Việt
  static String getVietnameseWeekdayName(int weekday) {
    const weekdays = [
      'Chủ nhật',
      'Thứ 2',
      'Thứ 3',
      'Thứ 4',
      'Thứ 5',
      'Thứ 6',
      'Thứ 7'
    ];
    return weekdays[weekday % 7];
  }

  /// Kiểm tra xem năm có phải năm nhuận không
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// Lấy số ngày trong tháng
  static int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// Thêm ngày vào DateTime
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  /// Thêm tháng vào DateTime
  static DateTime addMonths(DateTime date, int months) {
    return DateTime(date.year, date.month + months, date.day);
  }

  /// Thêm năm vào DateTime
  static DateTime addYears(DateTime date, int years) {
    return DateTime(date.year + years, date.month, date.day);
  }

  /// Làm tròn DateTime xuống ngày (bỏ giờ, phút, giây)
  static DateTime floorToDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Làm tròn DateTime lên ngày
  static DateTime ceilToDay(DateTime date) {
    return DateTime(date.year, date.month, date.day + 1);
  }

  /// Kiểm tra xem DateTime có nằm trong khoảng không
  static bool isBetween(DateTime date, DateTime start, DateTime end) {
    return date.isAfter(start) && date.isBefore(end);
  }

  /// Lấy tuổi từ ngày sinh
  static int getAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
