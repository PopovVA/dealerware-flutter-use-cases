import 'package:flutter/material.dart';
import 'package:dealerware_flutter_use_cases/core/utils/shorebird_update_service.dart';

class UpdateNotificationWidget extends StatelessWidget {
  final ShorebirdUpdateService updateService;

  const UpdateNotificationWidget({super.key, required this.updateService});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: updateService,
      builder: (context, _) {
        final state = updateService.state;
        final downloadProgress = updateService.downloadProgress;

        if (state == UpdateState.downloading) {
          return _DownloadingBanner(progress: downloadProgress);
        }

        if (state == UpdateState.ready) {
          return _ReadyBanner(onRestart: () => updateService.applyUpdate());
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _DownloadingBanner extends StatelessWidget {
  final double? progress;

  const _DownloadingBanner({this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.blue.shade100,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Downloading update...',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                if (progress != null && progress! > 0) ...[
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.blue.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${(progress! * 100).toInt()}%',
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade900),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReadyBanner extends StatelessWidget {
  final VoidCallback onRestart;

  const _ReadyBanner({required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.green.shade100,
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green.shade700, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Update ready',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  'Tap to restart the application',
                  style: TextStyle(fontSize: 12, color: Colors.green.shade900),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
