import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

enum UpdateState { idle, checking, downloading, ready, error }

class ShorebirdUpdateService extends ChangeNotifier {
  final ShorebirdUpdater _shorebirdUpdater = ShorebirdUpdater();

  UpdateState _state = UpdateState.idle;
  String? _errorMessage;
  double? _downloadProgress;

  UpdateState get state => _state;
  String? get errorMessage => _errorMessage;
  double? get downloadProgress => _downloadProgress;

  /// Checks for updates and downloads them if available
  Future<void> checkAndDownloadUpdate() async {
    if (_state == UpdateState.checking || _state == UpdateState.downloading) {
      return;
    }

    try {
      _state = UpdateState.checking;
      _errorMessage = null;
      notifyListeners();

      final updateStatus = await _shorebirdUpdater.checkForUpdate();

      if (updateStatus == UpdateStatus.outdated) {
        _state = UpdateState.downloading;
        _downloadProgress = 0.0;
        notifyListeners();

        // Download the update
        await _shorebirdUpdater.update();

        _state = UpdateState.ready;
        _downloadProgress = null;
        notifyListeners();
      } else {
        _state = UpdateState.idle;
        notifyListeners();
      }
    } on UpdateException catch (e) {
      _state = UpdateState.error;
      _errorMessage = e.toString();
      _downloadProgress = null;
      notifyListeners();
      debugPrint('Error checking for updates: $e');
    } catch (e) {
      _state = UpdateState.error;
      _errorMessage = e.toString();
      _downloadProgress = null;
      notifyListeners();
      debugPrint('Error checking for updates: $e');
    }
  }

  /// Applies the update and restarts the application
  Future<void> applyUpdate() async {
    try {
      // Update is already applied after calling update()
      // Close the app so the user can restart it manually
      // or the system will restart it automatically
      exit(0);
    } catch (e) {
      _state = UpdateState.error;
      _errorMessage = e.toString();
      notifyListeners();
      debugPrint('Error applying update: $e');
    }
  }

  /// Resets the service state
  void reset() {
    _state = UpdateState.idle;
    _errorMessage = null;
    _downloadProgress = null;
    notifyListeners();
  }
}
