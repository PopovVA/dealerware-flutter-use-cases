import 'package:dealerware_flutter_use_cases/features/posts/presentation/components/empty_state_widget.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/components/error_state_widget.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/components/loading_state_widget.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/components/post_card.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/pages/post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/posts/di/posts_providers.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/entities/post_entity.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/list/posts_list_state.dart';

class PostsListPage extends ConsumerStatefulWidget {
  const PostsListPage({super.key});

  @override
  ConsumerState<PostsListPage> createState() => _PostsListPageState();
}

class _PostsListPageState extends ConsumerState<PostsListPage> {
  @override
  void initState() {
    super.initState();
    // Load posts on page init
    Future.microtask(() {
      ref.read(postsListNotifierProvider.notifier).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(postsListNotifierProvider.notifier);
    final state = ref.watch(postsListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts GraphQL'),
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
        onPressed: () => _navigateToCreatePage(context),
        tooltip: 'Add Post',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PostsListState state,
    dynamic notifier,
  ) {
    return switch (state) {
      PostsListInitial() => _buildInitialState(context, notifier),
      PostsListLoading() => _buildLoadingState(context),
      PostsListEmpty() => _buildEmptyState(context, notifier),
      PostsListLoaded(:final posts) => _buildLoadedState(
        context,
        posts,
        notifier,
      ),
      PostsListDeleting(:final posts, :final deletingId) => _buildDeletingState(
        context,
        posts,
        deletingId,
        notifier,
      ),
      PostsListError(:final message) => _buildErrorState(
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
            Icons.article,
            size: 100,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 20),
          Text('Posts', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(
            'Ready to load posts',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => notifier.getAll(),
            icon: const Icon(Icons.download),
            label: const Text('Load Posts'),
          ),
        ],
      ),
    );
  }

  // Loading state
  Widget _buildLoadingState(BuildContext context) {
    return const LoadingStateWidget(message: 'Loading posts...');
  }

  // Empty state
  Widget _buildEmptyState(BuildContext context, dynamic notifier) {
    return EmptyStateWidget(
      title: 'No posts found',
      subtitle: 'Try refreshing or create a new post',
      icon: Icons.inbox,
      onRefresh: () => notifier.refresh(),
    );
  }

  // Loaded state
  Widget _buildLoadedState(
    BuildContext context,
    List<PostEntity> posts,
    dynamic notifier,
  ) {
    return RefreshIndicator(
      onRefresh: () => notifier.refresh(),
      child: ListView.builder(
        itemCount: posts.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(
            post: post,
            onDelete: () => _confirmDelete(context, post, notifier),
            onTap: () => _navigateToDetailPage(context, post.id),
          );
        },
      ),
    );
  }

  // Deleting state
  Widget _buildDeletingState(
    BuildContext context,
    List<PostEntity> posts,
    String deletingId,
    dynamic notifier,
  ) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final post = posts[index];
        final isDeleting = post.id == deletingId;

        return PostCard(
          post: post,
          isDeleting: isDeleting,
          onDelete: () => _confirmDelete(context, post, notifier),
          onTap: () => _navigateToDetailPage(context, post.id),
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
    return ErrorStateWidget(
      message: message,
      onRetry: () => notifier.refresh(),
    );
  }

  // Confirm delete dialog
  Future<void> _confirmDelete(
    BuildContext context,
    PostEntity post,
    dynamic notifier,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Post'),
        content: Text('Are you sure you want to delete "${post.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await notifier.deleteOneById(post.id);
    }
  }

  // Navigation
  Future<void> _navigateToDetailPage(
    BuildContext context,
    String postId,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PostDetailPage(postId: postId)),
    );
    // Refresh list after returning
    if (context.mounted) {
      ref.read(postsListNotifierProvider.notifier).refresh();
    }
  }

  Future<void> _navigateToCreatePage(BuildContext context) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const PostDetailPage()));
    // Refresh list after returning
    if (context.mounted) {
      ref.read(postsListNotifierProvider.notifier).refresh();
    }
  }
}
