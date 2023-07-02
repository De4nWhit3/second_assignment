import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_assignment/2_application/services/theme_service.dart';
import 'package:second_assignment/app_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Some title'),
              actions: [
                Switch(
                  value: Provider.of<ThemeService>(context).isDarkModeOn,
                  onChanged: (_) {
                    Provider.of<ThemeService>(context, listen: false)
                        .toggleDarkMode();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
