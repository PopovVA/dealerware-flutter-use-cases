import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/response_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:dealerware_flutter_use_cases/core/utils/date_formatter.dart';

/// Coordinates value object for UI convenience
class CoordinatesEntity extends Equatable {
  final double latitude;
  final double longitude;

  const CoordinatesEntity({required this.latitude, required this.longitude});

  /// Format coordinates for display
  String get formatted =>
      '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}';

  /// Get Google Maps URL
  String get mapsUrl => 'https://www.google.com/maps?q=$latitude,$longitude';

  @override
  List<Object?> get props => [latitude, longitude];

  @override
  String toString() => formatted;
}

/// Domain entity for Dealership - UI-friendly representation
class DealershipEntity extends Equatable {
  final String id;
  final String name;
  final String address;
  final CoordinatesEntity coordinates;
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
  factory DealershipEntity.fromDTO(DealershipResponseDTO dto) {
    return DealershipEntity(
      id: dto.id,
      name: dto.name,
      address: dto.address,
      coordinates: CoordinatesEntity(
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
    CoordinatesEntity? coordinates,
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
  List<Object?> get props => [id, name, address, coordinates, createdAt];

  @override
  bool get stringify => true;
}
