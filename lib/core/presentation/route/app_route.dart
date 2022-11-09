import 'package:auto_route/auto_route.dart';
import 'package:base_structure/detail/presentation/detail_screen.dart';
import 'package:base_structure/home/presentation/home_screen.dart';
import 'package:base_structure/home/presentation/widget/transaction_dialog.dart';
import 'package:flutter/material.dart';

import '../../../home/infrastructure/model/transaction.dart';

part 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: DetailScreen, path: "/detail"),
    AutoRoute(
      page: TransactionDialogScreen,
    )
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}
