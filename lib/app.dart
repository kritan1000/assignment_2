import 'package:flutter/material.dart';
import 'package:assignment_2/views/dashboard_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardView(),
    );
  }
}