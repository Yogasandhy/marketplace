import 'package:flutter/material.dart';
import 'package:sagara/presentation/home/home_page.dart';
import 'package:sagara/presentation/login/login_page.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late final WidgetBuilder builder;
    switch (settings.name) {
      case home:
        builder = (_) => const HomePage();
        break;
      case login:
      default:
        builder = (_) => const LoginPage();
        break;
    }

    return PageRouteBuilder<void>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        final offset = Tween<Offset>(
          begin: const Offset(0, 0.04),
          end: Offset.zero,
        ).animate(curved);
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(position: offset, child: child),
        );
      },
    );
  }
}
