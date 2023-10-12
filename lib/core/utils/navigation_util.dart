import 'package:flutter/material.dart';

class NavigationUtil {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments : arguments) ?? Future.value();
  }

  void goBack() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    }
  }
}
