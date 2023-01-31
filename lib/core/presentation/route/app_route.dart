import 'package:auto_route/auto_route.dart';
import 'package:base_structure/presentation/home/home_screen.dart';
import 'package:base_structure/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

part 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: false, path: "/login"),
    AutoRoute(page: HomeScreen, initial: true)
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}
// success 