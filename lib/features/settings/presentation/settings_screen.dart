import 'package:app_configurations/features/settings/providers/animation_controller.dart';
import 'package:app_configurations/features/settings/providers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigurationScreen extends ConsumerWidget {
  static const WidgetStateProperty<Icon> switchIcons =
      WidgetStateProperty<Icon>.fromMap({
        WidgetState.selected: Icon(Icons.check),
        WidgetState.any: Icon(Icons.close),
      });

  static const WidgetStateProperty<Icon> themeIcons =
      WidgetStateProperty<Icon>.fromMap({
        WidgetState.selected: Icon(Icons.dark_mode),
        WidgetState.any: Icon(Icons.light_mode),
      });

  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeControllerProvider) == ThemeMode.dark;
    final animationEnabled = ref.watch(appAnimationControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: SwitchListTile(
                title: const Text('Animaciones'),
                subtitle: const Text(
                  'Activar o desactivar animaciones',
                ),
                value: animationEnabled,
                thumbIcon: switchIcons,
                onChanged: ref
                    .watch(appAnimationControllerProvider.notifier)
                    .toggleAnimation,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: SwitchListTile(
                title: const Text('Tema'),
                subtitle: Text(isDarkMode ? 'Oscuro' : 'Claro'),
                value: isDarkMode,
                thumbIcon: themeIcons,
                onChanged: ref
                    .watch(themeControllerProvider.notifier)
                    .toggleTheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
