import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/posts/di/posts_providers.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/update.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/detailed/post_detail_state.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final String? postId;

  const PostDetailPage({super.key, this.postId});

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  bool get isEditMode => widget.postId != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      // Load post data for editing
      Future.microtask(() {
        ref
            .read(postDetailNotifierProvider.notifier)
            .loadPostById(widget.postId!);
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _populateForm(PostDetailLoaded state) {
    final post = state.post;
    if (_titleController.text.isEmpty) {
      _titleController.text = post.title;
      _bodyController.text = post.body;
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();

    final notifier = ref.read(postDetailNotifierProvider.notifier);

    if (isEditMode) {
      await notifier.updatePost(
        UpdatePostParams(id: widget.postId!, title: title, body: body),
      );
    } else {
      await notifier.createPost(CreatePostParams(title: title, body: body));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postDetailNotifierProvider);

    // Populate form when data is loaded
    if (state is PostDetailLoaded && isEditMode) {
      _populateForm(state);
    }

    // Handle success states
    ref.listen(postDetailNotifierProvider, (previous, next) {
      if (next is PostDetailCreated) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Post "${next.post.title}" created!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      } else if (next is PostDetailUpdated) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Post "${next.post.title}" updated!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      } else if (next is PostDetailError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Post' : 'Create Post'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, PostDetailState state) {
    return switch (state) {
      PostDetailInitial() => _buildForm(context, isLoading: false),
      PostDetailLoading() => _buildLoadingState(context),
      PostDetailLoaded() => _buildForm(context, isLoading: false),
      PostDetailCreating() => _buildForm(context, isLoading: true),
      PostDetailUpdating() => _buildForm(context, isLoading: true),
      PostDetailCreated() => _buildForm(context, isLoading: false),
      PostDetailUpdated() => _buildForm(context, isLoading: false),
      PostDetailError(:final message) => _buildErrorState(context, message),
    };
  }

  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading post...'),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text('Error', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
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
            // Title field
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter post title',
                prefixIcon: const Icon(Icons.title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              maxLength: 100,
              enabled: !isLoading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                if (value.trim().length < 3) {
                  return 'Title must be at least 3 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Body field
            TextFormField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText: 'Body',
                hintText: 'Enter post content',
                alignLabelWithHint: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Icon(Icons.article),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              maxLines: 8,
              maxLength: 500,
              enabled: !isLoading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter post content';
                }
                if (value.trim().length < 10) {
                  return 'Body must be at least 10 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Submit button
            ElevatedButton(
              onPressed: isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      isEditMode ? 'Update Post' : 'Create Post',
                      style: const TextStyle(fontSize: 16),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
