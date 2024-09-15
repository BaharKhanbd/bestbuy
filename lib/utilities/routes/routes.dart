import 'package:bestbuy/home_view.dart';
import 'package:bestbuy/utilities/routes/routes_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.splash:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      // case RoutesName.register:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const LoginView());

      //  case RoutesName.logOut:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const LogOutView());

      case RoutesName.newMachine:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.oldMachine:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.regalSupport:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.engineeringSupport:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.allAccessories:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.others:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.salesOldMachine:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.diagnostic:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      //      case RoutesName.diagnosticDetailsView:
      // return MaterialPageRoute(
      //     builder: (BuildContext context) => const DiagnosticDetailsView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
