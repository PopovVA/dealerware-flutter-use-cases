import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/request/create_request_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/response/response_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/request/update_request_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';

/// Mock implementation of Dealerships repository with 20 items
class MockDealershipsRepository implements IDealershipsRepository {
  late List<DealershipResponseDTO> _dealerships;

  MockDealershipsRepository() {
    _dealerships = _createMockDealerships();
  }

  static List<DealershipResponseDTO> _createMockDealerships() {
    final now = DateTime.now();
    return List.generate(20, (i) {
      final n = i + 1;
      return DealershipResponseDTO(
        id: '$n',
        name: 'Dealership $n',
        address: '$n${n * 100} Mock Street',
        latitude: -75.0 + n * 0.5,
        longitude: 168.0 + n * 0.3,
        createdAt: now.subtract(Duration(days: 20 - n)),
      );
    });
  }

  @override
  Future<DealershipsDTO> getAll() async => List.from(_dealerships);

  @override
  Future<DealershipResponseDTO> getOne(String id) async {
    final index = _dealerships.indexWhere((d) => d.id == id);
    if (index < 0) throw Exception('Dealership not found: $id');
    return _dealerships[index];
  }

  @override
  Future<DealershipResponseDTO> create(
    DealershipCreateRequestDTO newDealership,
  ) async {
    final id = (_dealerships.map((d) => int.tryParse(d.id) ?? 0).fold<int>(0, (a, b) => a > b ? a : b) + 1).toString();
    final created = DealershipResponseDTO(
      id: id,
      name: newDealership.name,
      address: newDealership.address,
      latitude: newDealership.latitude,
      longitude: newDealership.longitude,
      createdAt: DateTime.now(),
    );
    _dealerships.add(created);
    return created;
  }

  @override
  Future<DealershipResponseDTO> update(
    DealershipUpdateRequestDTO updatedDealership,
  ) async {
    final index = _dealerships.indexWhere((d) => d.id == updatedDealership.id);
    if (index < 0) throw Exception('Dealership not found: ${updatedDealership.id}');
    final existing = _dealerships[index];
    final updated = DealershipResponseDTO(
      id: existing.id,
      name: updatedDealership.name ?? existing.name,
      address: updatedDealership.address ?? existing.address,
      latitude: updatedDealership.latitude ?? existing.latitude,
      longitude: updatedDealership.longitude ?? existing.longitude,
      createdAt: existing.createdAt,
    );
    _dealerships[index] = updated;
    return updated;
  }

  @override
  Future<void> delete(String id) async {
    _dealerships.removeWhere((d) => d.id == id);
  }
}
