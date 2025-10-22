import 'package:dealerware_flutter_use_cases/core/utils/date_formatter.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/dealership_DTO.dart';
import 'package:intl/intl.dart';

/// Coordinates value object for UI convenience
class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({required this.latitude, required this.longitude});

  /// Format coordinates for display
  String get formatted =>
      '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}';

  /// Get Google Maps URL
  String get mapsUrl => 'https://www.google.com/maps?q=$latitude,$longitude';

  @override
  String toString() => formatted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinates &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

/// Domain entity for Dealership - UI-friendly representation
class DealershipEntity {
  final String id;
  final String name;
  final String address;
  final Coordinates coordinates;
  final String formattedDate;
  final DateTime createdAt;

  const DealershipEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.coordinates,
    required this.formattedDate,
    required this.createdAt,
  });

  /// Create entity from DTO
  factory DealershipEntity.fromDTO(DealershipDTO dto) {
    return DealershipEntity(
      id: dto.id,
      name: dto.name,
      address: dto.address,
      coordinates: Coordinates(
        latitude: dto.latitude,
        longitude: dto.longitude,
      ),
      formattedDate: DateFormatter.formatRelative(
        dto.createdAt,
        now: DateTime.now(),
      ),
      createdAt: dto.createdAt,
    );
  }

  /// Get full formatted date and time
  String get fullFormattedDate =>
      DateFormat('MMMM dd, yyyy HH:mm').format(createdAt);

  /// Copy with method for immutability
  DealershipEntity copyWith({
    String? id,
    String? name,
    String? address,
    Coordinates? coordinates,
    String? formattedDate,
    DateTime? createdAt,
  }) {
    return DealershipEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      coordinates: coordinates ?? this.coordinates,
      formattedDate: formattedDate ?? this.formattedDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DealershipEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'DealershipEntity(id: $id, name: $name)';
}
