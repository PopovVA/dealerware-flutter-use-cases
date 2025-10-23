import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/components/dealership_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/di/dealerships_providers.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/list/dealerships_list_state.dart';

class DealershipsPage extends ConsumerStatefulWidget {
  const DealershipsPage({super.key});

  @override
  ConsumerState<DealershipsPage> createState() => _DealershipsPageState();
}

class _DealershipsPageState extends ConsumerState<DealershipsPage> {
  @override
  void initState() {
    super.initState();
    // Load dealerships on page init
    Future.microtask(() {
      ref.read(dealershipsListNotifierProvider.notifier).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(dealershipsListNotifierProvider.notifier);
    final state = ref.watch(dealershipsListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dealerships REST'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _buildBody(context, state, notifier),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create dealership page
        },
        tooltip: 'Add Dealership',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    DealershipsListState state,
    dynamic notifier,
  ) {
    return switch (state) {
      DealershipsListInitial() => _buildInitialState(context, notifier),
      DealershipsListLoading() => _buildLoadingState(context),
      DealershipsListEmpty() => _buildEmptyState(context, notifier),
      DealershipsListLoaded(:final dealerships) => _buildLoadedState(
        context,
        dealerships,
        notifier,
      ),
      DealershipsListDeleting(:final dealerships, :final deletingId) =>
        _buildDeletingState(context, dealerships, deletingId, notifier),
      DealershipsListError(:final message) => _buildErrorState(
        context,
        message,
        notifier,
      ),
    };
  }

  // Initial state
  Widget _buildInitialState(BuildContext context, dynamic notifier) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.store,
            size: 100,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 20),
          Text(
            'Dealerships',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'Ready to load dealerships',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => notifier.getAll(),
            icon: const Icon(Icons.download),
            label: const Text('Load Dealerships'),
          ),
        ],
      ),
    );
  }

  // Loading state
  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading dealerships...'),
        ],
      ),
    );
  }

  // Empty state
  Widget _buildEmptyState(BuildContext context, dynamic notifier) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 100,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 20),
          Text(
            'No Dealerships',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            'The list is empty. Add your first dealership!',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => notifier.refresh(),
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
        ],
      ),
    );
  }

  // Loaded state
  Widget _buildLoadedState(
    BuildContext context,
    List<DealershipEntity> dealerships,
    dynamic notifier,
  ) {
    return RefreshIndicator(
      onRefresh: () => notifier.refresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: dealerships.length,
        itemBuilder: (context, index) {
          final dealership = dealerships[index];
          return DealershipCard(
            dealership: dealership,
            onDelete: () => _showDeleteDialog(context, dealership, notifier),
          );
        },
      ),
    );
  }

  // Deleting state
  Widget _buildDeletingState(
    BuildContext context,
    List<DealershipEntity> dealerships,
    String deletingId,
    dynamic notifier,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: dealerships.length,
      itemBuilder: (context, index) {
        final dealership = dealerships[index];
        final isDeleting = dealership.id == deletingId;
        return DealershipCard(
          dealership: dealership,
          isDeleting: isDeleting,
          onDelete: isDeleting
              ? null
              : () => _showDeleteDialog(context, dealership, notifier),
        );
      },
    );
  }

  // Error state
  Widget _buildErrorState(
    BuildContext context,
    String message,
    dynamic notifier,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 100,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 20),
            Text(
              'Error',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => notifier.refresh(),
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteDialog(
    BuildContext context,
    DealershipEntity dealership,
    dynamic notifier,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Dealership'),
        content: Text('Are you sure you want to delete "${dealership.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await notifier.deleteOneById(dealership.id);
    }
  }
}
