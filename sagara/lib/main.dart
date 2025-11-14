import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sagara/core/theme/app_theme.dart';
import 'package:sagara/presentation/routes/app_routes.dart';
import 'package:sagara/providers/login_provider.dart';
import 'package:sagara/providers/product_provider.dart';

Widget buildApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
      ChangeNotifierProvider<ProductProvider>(
        create: (_) => ProductProvider(),
      ),
    ],
    child: const MyApp(),
  );
}

void main() {
  runApp(buildApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace+',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
