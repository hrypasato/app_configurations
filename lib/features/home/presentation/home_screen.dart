import 'package:app_configurations/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.zoom);
            },
            label: Text("Zoom image"),
            icon: Icon(Icons.zoom_in_rounded),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.wheel);
            },
            label: Text("Wheel"),
            icon: Icon(Icons.flag_circle_rounded),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.configuration);
            },
            label: Text("Settings"),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
