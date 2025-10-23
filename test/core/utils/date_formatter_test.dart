import 'package:flutter_test/flutter_test.dart';
import 'package:dealerware_flutter_use_cases/core/utils/date_formatter.dart';

void main() {
  group('DateFormatter', () {
    group('formatRelative', () {
      test('given date is now, '
          'when formatRelative is called, '
          'then should return "Just now"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 15, 12, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, 'Just now');
      });

      test('given date is 30 seconds ago, '
          'when formatRelative is called, '
          'then should return "Just now"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 15, 12, 0, 30);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, 'Just now');
      });

      test('given date is 1 minute ago, '
          'when formatRelative is called, '
          'then should return "1m ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 15, 12, 1, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '1m ago');
      });

      test('given date is 45 minutes ago, '
          'when formatRelative is called, '
          'then should return "45m ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 15, 12, 45, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '45m ago');
      });

      test('given date is 1 hour ago, '
          'when formatRelative is called, '
          'then should return "1h ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 15, 13, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '1h ago');
      });

      test('given date is 5 hours ago, '
          'when formatRelative is called, '
          'then should return "5h ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 15, 17, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '5h ago');
      });

      test('given date is 23 hours ago (same day), '
          'when formatRelative is called, '
          'then should return "23h ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 15, 23, 0, 0);
        final date = DateTime(2024, 1, 15, 0, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '23h ago');
      });

      test('given date is 1 day ago, '
          'when formatRelative is called, '
          'then should return "1d ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 16, 12, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '1d ago');
      });

      test('given date is 3 days ago, '
          'when formatRelative is called, '
          'then should return "3d ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 18, 12, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '3d ago');
      });

      test('given date is 6 days ago (edge case), '
          'when formatRelative is called, '
          'then should return "6d ago"', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 21, 12, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, '6d ago');
      });

      test('given date is 7 days ago, '
          'when formatRelative is called, '
          'then should return formatted date', () {
        // Arrange (Given)
        final now = DateTime(2024, 1, 22, 12, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, 'Jan 15, 2024');
      });

      test('given date is 30 days ago, '
          'when formatRelative is called, '
          'then should return formatted date', () {
        // Arrange (Given)
        final now = DateTime(2024, 2, 14, 12, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, 'Jan 15, 2024');
      });

      test('given date is 1 year ago, '
          'when formatRelative is called, '
          'then should return formatted date', () {
        // Arrange (Given)
        final now = DateTime(2025, 1, 15, 12, 0, 0);
        final date = DateTime(2024, 1, 15, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, 'Jan 15, 2024');
      });

      test('given date is in different month, '
          'when formatRelative is called with 10 days ago, '
          'then should return formatted date', () {
        // Arrange (Given)
        final now = DateTime(2024, 2, 5, 12, 0, 0);
        final date = DateTime(2024, 1, 26, 12, 0, 0);

        // Act (When)
        final result = DateFormatter.formatRelative(date, now: now);

        // Assert (Then)
        expect(result, 'Jan 26, 2024');
      });

      test('given no "now" parameter is provided, '
          'when formatRelative is called, '
          'then should use current DateTime', () {
        // Arrange (Given)
        final now = DateTime.now();
        final date = now.subtract(const Duration(minutes: 30));

        // Act (When)
        final result = DateFormatter.formatRelative(date);

        // Assert (Then)
        // Should return relative time (approximately 30m ago)
        expect(result, matches(r'\d+m ago'));
      });

      group('Edge cases', () {
        test('given date is in the future (1 minute), '
            'when formatRelative is called, '
            'then should show negative time', () {
          // Arrange (Given)
          final now = DateTime(2024, 1, 15, 12, 0, 0);
          final date = DateTime(2024, 1, 15, 12, 1, 0);

          // Act (When)
          final result = DateFormatter.formatRelative(date, now: now);

          // Assert (Then)
          // Future date results in negative difference
          expect(result, '-1m ago');
        });

        test('given date at midnight, '
            'when formatRelative is called, '
            'then should format correctly', () {
          // Arrange (Given)
          final now = DateTime(2024, 1, 15, 12, 0, 0);
          final date = DateTime(2024, 1, 15, 0, 0, 0);

          // Act (When)
          final result = DateFormatter.formatRelative(date, now: now);

          // Assert (Then)
          expect(result, '12h ago');
        });

        test('given date at year boundary, '
            'when formatRelative is called with 10 days difference, '
            'then should return formatted date', () {
          // Arrange (Given)
          final now = DateTime(2024, 1, 5, 12, 0, 0);
          final date = DateTime(2023, 12, 26, 12, 0, 0);

          // Act (When)
          final result = DateFormatter.formatRelative(date, now: now);

          // Assert (Then)
          expect(result, 'Dec 26, 2023');
        });
      });
    });
  });
}
