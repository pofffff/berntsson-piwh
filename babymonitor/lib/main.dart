import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'design/theme.dart';
import 'features/monitor/presentation/monitor_page.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const BabyMonitorApp());
}

class BabyMonitorApp extends StatelessWidget {
  const BabyMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Monitor',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const MonitorPage(),
    );
  }
}
