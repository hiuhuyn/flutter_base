import 'package:flutter/material.dart';

/// Utility class cho xử lý chuỗi
class StringUtils {
  /// Kiểm tra chuỗi có rỗng hoặc null không
  static bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  /// Kiểm tra chuỗi có không rỗng không
  static bool isNotEmpty(String? value) {
    return !isEmpty(value);
  }

  /// Lấy chuỗi rỗng nếu null
  static String nullToEmpty(String? value) {
    return value ?? '';
  }

  /// Lấy chuỗi mặc định nếu null hoặc rỗng
  static String defaultIfEmpty(String? value, String defaultValue) {
    return isEmpty(value) ? defaultValue : value!;
  }

  /// Cắt chuỗi với độ dài tối đa
  static String truncate(String value, int maxLength, {String suffix = '...'}) {
    if (value.length <= maxLength) return value;
    return '${value.substring(0, maxLength)}$suffix';
  }

  /// Viết hoa chữ cái đầu
  static String capitalize(String value) {
    if (isEmpty(value)) return value;
    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  /// Viết hoa chữ cái đầu của mỗi từ
  static String capitalizeWords(String value) {
    if (isEmpty(value)) return value;
    return value.split(' ').map((word) => capitalize(word)).join(' ');
  }

  /// Loại bỏ khoảng trắng thừa
  static String trimWhitespace(String value) {
    return value.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Loại bỏ tất cả khoảng trắng
  static String removeAllWhitespace(String value) {
    return value.replaceAll(RegExp(r'\s'), '');
  }

  /// Kiểm tra email có hợp lệ không
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Kiểm tra số điện thoại Việt Nam có hợp lệ không
  static bool isValidVietnamesePhone(String phone) {
    // Loại bỏ tất cả ký tự không phải số
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');

    // Kiểm tra các format số điện thoại Việt Nam
    return RegExp(r'^(0[3|5|7|8|9])[0-9]{8}$').hasMatch(cleanPhone) ||
        RegExp(r'^(\+84|84)[3|5|7|8|9][0-9]{8}$').hasMatch(cleanPhone);
  }

  /// Format số điện thoại Việt Nam
  static String formatVietnamesePhone(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanPhone.startsWith('84')) {
      return '+84 ${cleanPhone.substring(2, 5)} ${cleanPhone.substring(5, 8)} ${cleanPhone.substring(8)}';
    } else if (cleanPhone.startsWith('0')) {
      return '0${cleanPhone.substring(1, 4)} ${cleanPhone.substring(4, 7)} ${cleanPhone.substring(7)}';
    }

    return phone;
  }

  /// Kiểm tra mật khẩu có đủ mạnh không
  static bool isStrongPassword(String password) {
    // Ít nhất 8 ký tự, có chữ hoa, chữ thường, số và ký tự đặc biệt
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  /// Kiểm tra URL có hợp lệ không
  static bool isValidUrl(String url) {
    try {
      Uri.parse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Tạo slug từ chuỗi
  static String createSlug(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .replaceAll(RegExp(r'[-\s]+'), '-')
        .trim();
  }

  /// Loại bỏ dấu tiếng Việt
  static String removeVietnameseAccents(String text) {
    const vietnamese =
        'àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ';
    const english =
        'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd';

    String result = text;
    for (int i = 0; i < vietnamese.length; i++) {
      result = result.replaceAll(vietnamese[i], english[i]);
    }
    return result;
  }

  /// Đếm số từ trong chuỗi
  static int countWords(String text) {
    if (isEmpty(text)) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }

  /// Lấy từ đầu tiên của chuỗi
  static String getFirstWord(String text) {
    if (isEmpty(text)) return '';
    final words = text.trim().split(RegExp(r'\s+'));
    return words.isNotEmpty ? words.first : '';
  }

  /// Lấy từ cuối cùng của chuỗi
  static String getLastWord(String text) {
    if (isEmpty(text)) return '';
    final words = text.trim().split(RegExp(r'\s+'));
    return words.isNotEmpty ? words.last : '';
  }

  /// Kiểm tra chuỗi có chứa số không
  static bool containsNumber(String text) {
    return RegExp(r'[0-9]').hasMatch(text);
  }

  /// Kiểm tra chuỗi có chứa chữ cái không
  static bool containsLetter(String text) {
    return RegExp(r'[a-zA-Z]').hasMatch(text);
  }

  /// Lấy tất cả số từ chuỗi
  static String extractNumbers(String text) {
    return text.replaceAll(RegExp(r'[^\d]'), '');
  }

  /// Lấy tất cả chữ cái từ chuỗi
  static String extractLetters(String text) {
    return text.replaceAll(RegExp(r'[^a-zA-Z]'), '');
  }

  /// Format số tiền Việt Nam
  static String formatVietnameseCurrency(double amount) {
    final formatter = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return '${amount.toStringAsFixed(0).replaceAllMapped(formatter, (Match m) => '${m[1]},')} ₫';
  }

  /// Format số với dấu phẩy
  static String formatNumber(double number, {int decimalPlaces = 0}) {
    final formatter = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return number
        .toStringAsFixed(decimalPlaces)
        .replaceAllMapped(formatter, (Match m) => '${m[1]},');
  }

  /// Tạo chuỗi ngẫu nhiên
  static String generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    final buffer = StringBuffer();

    for (int i = 0; i < length; i++) {
      buffer.write(chars[(random + i) % chars.length]);
    }

    return buffer.toString();
  }

  /// Tạo UUID đơn giản
  static String generateSimpleUUID() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toRadixString(36);
    final random =
        (DateTime.now().microsecondsSinceEpoch % 1000000).toRadixString(36);
    return '$timestamp-$random';
  }

  /// So sánh chuỗi không phân biệt hoa thường
  static bool equalsIgnoreCase(String? a, String? b) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    return a.toLowerCase() == b.toLowerCase();
  }

  /// Kiểm tra chuỗi có bắt đầu bằng prefix không (không phân biệt hoa thường)
  static bool startsWithIgnoreCase(String text, String prefix) {
    return text.toLowerCase().startsWith(prefix.toLowerCase());
  }

  /// Kiểm tra chuỗi có kết thúc bằng suffix không (không phân biệt hoa thường)
  static bool endsWithIgnoreCase(String text, String suffix) {
    return text.toLowerCase().endsWith(suffix.toLowerCase());
  }

  /// Tìm và thay thế tất cả (không phân biệt hoa thường)
  static String replaceAllIgnoreCase(String text, String from, String to) {
    return text.replaceAll(RegExp(from, caseSensitive: false), to);
  }

  /// Chuyển đổi camelCase thành snake_case
  static String camelToSnake(String text) {
    return text.replaceAllMapped(
        RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}');
  }

  /// Chuyển đổi snake_case thành camelCase
  static String snakeToCamel(String text) {
    return text.replaceAllMapped(
        RegExp(r'_([a-z])'), (match) => match.group(1)!.toUpperCase());
  }

  /// Tạo hash đơn giản từ chuỗi
  static int simpleHash(String text) {
    int hash = 0;
    for (int i = 0; i < text.length; i++) {
      hash = ((hash << 5) - hash + text.codeUnitAt(i)) & 0xffffffff;
    }
    return hash;
  }

  /// Kiểm tra chuỗi có phải palindrome không
  static bool isPalindrome(String text) {
    final cleanText = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleanText == cleanText.split('').reversed.join('');
  }

  /// Đảo ngược chuỗi
  static String reverse(String text) {
    return text.split('').reversed.join('');
  }

  /// Lấy độ dài chuỗi (hỗ trợ emoji)
  static int getLength(String text) {
    return text.runes.length;
  }

  /// Lấy ký tự tại vị trí (hỗ trợ emoji)
  static String? charAt(String text, int index) {
    final runes = text.runes.toList();
    if (index < 0 || index >= runes.length) return null;
    return String.fromCharCode(runes[index]);
  }
}
