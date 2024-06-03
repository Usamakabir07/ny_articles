import 'package:flutter/material.dart';
import 'package:ny_articles/route_generator.dart';
import 'package:ny_articles/utils/navigation_service.dart';
import 'package:ny_articles/view/articles/articles_screen.dart';
import 'package:ny_articles/viewModels/articles_view_model.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.serviceLocator<ArticlesViewModel>(),
        ),
      ],
      child: Consumer<ArticlesViewModel>(
        builder: (context, settings, child) {
          return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            title: 'Ny Articles',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            onUnknownRoute: (settings) => MaterialPageRoute(
              builder: (_) => const ArticlesScreen(),
              settings: settings,
            ),
          );
        },
      ),
    );
  }
}
