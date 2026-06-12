import 'package:app_configurations/features/settings/providers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_configurations/routes/app_routes.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'App Configurations',
      themeMode: ref.watch(themeControllerProvider),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // CRITICAL: NEVER REMOVE OR MODIFY
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
      // END CRITICAL SECTION
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initial,
    );
  }
}
