import 'package:flutter/material.dart';
import 'package:dealerware_flutter_use_cases/core/utils/shorebird_update_service.dart';
import 'package:dealerware_flutter_use_cases/core/widgets/update_notification_widget.dart';
import 'package:dealerware_flutter_use_cases/features/home/presentation/pages/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final ShorebirdUpdateService _updateService;

  @override
  void initState() {
    super.initState();
    _updateService = ShorebirdUpdateService();
    WidgetsBinding.instance.addObserver(this);

    // Check for updates on app start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateService.checkAndDownloadUpdate();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _updateService.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Check for updates when app returns to active state
    if (state == AppLifecycleState.resumed) {
      _updateService.checkAndDownloadUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dealerware Use Cases',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Column(
          children: [
            UpdateNotificationWidget(updateService: _updateService),
            const Expanded(child: HomePage()),
          ],
        ),
      ),
    );
  }
}
