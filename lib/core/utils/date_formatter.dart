import 'package:intl/intl.dart';

class DateFormatter {
  static String formatRelative(DateTime date, {DateTime? now}) {
    final currentTime = now ?? DateTime.now();
    final difference = currentTime.difference(date);

    // If less than 1 day ago, show relative time
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        }
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    }

    // If less than 7 days ago, show days
    if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    }

    // Otherwise show formatted date
    return DateFormat('MMM dd, yyyy').format(date);
  }
}
