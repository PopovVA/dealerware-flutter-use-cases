import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/di/dealerships_providers.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/update.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/detailed/dealership_detail_state.dart';

class DetailedDealershipPage extends ConsumerStatefulWidget {
  final String? dealershipId;

  const DetailedDealershipPage({super.key, this.dealershipId});

  @override
  ConsumerState<DetailedDealershipPage> createState() =>
      _DetailedDealershipPageState();
}

class _DetailedDealershipPageState
    extends ConsumerState<DetailedDealershipPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  bool get isEditMode => widget.dealershipId != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      // Load dealership data for editing
      Future.microtask(() {
        ref
            .read(dealershipDetailNotifierProvider.notifier)
            .loadDealershipById(widget.dealershipId!);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  void _populateForm(DealershipDetailLoaded state) {
    final dealership = state.dealership;
    if (_nameController.text.isEmpty) {
      _nameController.text = dealership.name;
      _addressController.text = dealership.address;
      _latitudeController.text = dealership.coordinates.latitude.toString();
      _longitudeController.text = dealership.coordinates.longitude.toString();
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final address = _addressController.text.trim();
    final latitude = double.parse(_latitudeController.text.trim());
    final longitude = double.parse(_longitudeController.text.trim());

    final notifier = ref.read(dealershipDetailNotifierProvider.notifier);

    if (isEditMode) {
      await notifier.updateDealership(
        UpdateDealershipParams(
          id: widget.dealershipId!,
          name: name,
          address: address,
          latitude: latitude,
          longitude: longitude,
        ),
      );
    } else {
      await notifier.createDealership(
        CreateDealershipParams(
          name: name,
          address: address,
          latitude: latitude,
          longitude: longitude,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dealershipDetailNotifierProvider);

    // Populate form when data is loaded
    if (state is DealershipDetailLoaded && isEditMode) {
      _populateForm(state);
    }

    // Handle success states
    ref.listen(dealershipDetailNotifierProvider, (previous, next) {
      if (next is DealershipDetailCreated) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dealership "${next.dealership.name}" created!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      } else if (next is DealershipDetailUpdated) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dealership "${next.dealership.name}" updated!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      } else if (next is DealershipDetailError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Dealership' : 'Create Dealership'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, DealershipDetailState state) {
    return switch (state) {
      DealershipDetailInitial() => _buildForm(context, isLoading: false),
      DealershipDetailLoading() => _buildLoadingState(context),
      DealershipDetailLoaded() => _buildForm(context, isLoading: false),
      DealershipDetailCreating() => _buildForm(context, isLoading: true),
      DealershipDetailUpdating() => _buildForm(context, isLoading: true),
      DealershipDetailCreated() => _buildForm(context, isLoading: false),
      DealershipDetailUpdated() => _buildForm(context, isLoading: false),
      DealershipDetailError(:final message) => _buildErrorState(
        context,
        message,
      ),
    };
  }

  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading dealership...'),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            if (isEditMode)
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(dealershipDetailNotifierProvider.notifier)
                      .loadDealershipById(widget.dealershipId!);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              )
            else
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Go Back'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, {required bool isLoading}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name field
            TextFormField(
              controller: _nameController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter dealership name',
                prefixIcon: Icon(Icons.store),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a name';
                }
                if (value.trim().length < 3) {
                  return 'Name must be at least 3 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Address field
            TextFormField(
              controller: _addressController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Address',
                hintText: 'Enter dealership address',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter an address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Latitude field
            TextFormField(
              controller: _latitudeController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Latitude',
                hintText: 'Enter latitude (-90 to 90)',
                prefixIcon: Icon(Icons.map),
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
              ],
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter latitude';
                }
                final lat = double.tryParse(value.trim());
                if (lat == null) {
                  return 'Please enter a valid number';
                }
                if (lat < -90 || lat > 90) {
                  return 'Latitude must be between -90 and 90';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Longitude field
            TextFormField(
              controller: _longitudeController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Longitude',
                hintText: 'Enter longitude (-180 to 180)',
                prefixIcon: Icon(Icons.map),
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
              ],
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter longitude';
                }
                final lon = double.tryParse(value.trim());
                if (lon == null) {
                  return 'Please enter a valid number';
                }
                if (lon < -180 || lon > 180) {
                  return 'Longitude must be between -180 and 180';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Submit button
            FilledButton.icon(
              onPressed: isLoading ? null : _submitForm,
              icon: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Icon(isEditMode ? Icons.save : Icons.add),
              label: Text(
                isLoading
                    ? (isEditMode ? 'Updating...' : 'Creating...')
                    : (isEditMode ? 'Update Dealership' : 'Create Dealership'),
              ),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 12),

            // Cancel button
            OutlinedButton(
              onPressed: isLoading ? null : () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),

            if (isEditMode) ...[
              const SizedBox(height: 24),
              Text(
                'Tip: You can use this form to update the dealership information',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
