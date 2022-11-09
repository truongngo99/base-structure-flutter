// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_route.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    DetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DetailScreen(),
      );
    },
    TransactionDialogRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionDialogRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TransactionDialogScreen(
          key: args.key,
          transaction: args.transaction,
          onClickDone: args.onClickDone,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          DetailRoute.name,
          path: '/detail',
        ),
        RouteConfig(
          TransactionDialogRoute.name,
          path: '/transaction-dialog-screen',
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DetailScreen]
class DetailRoute extends PageRouteInfo<void> {
  const DetailRoute()
      : super(
          DetailRoute.name,
          path: '/detail',
        );

  static const String name = 'DetailRoute';
}

/// generated route for
/// [TransactionDialogScreen]
class TransactionDialogRoute extends PageRouteInfo<TransactionDialogRouteArgs> {
  TransactionDialogRoute({
    Key? key,
    Transaction? transaction,
    required dynamic Function(
      String,
      double,
      bool,
    )
        onClickDone,
  }) : super(
          TransactionDialogRoute.name,
          path: '/transaction-dialog-screen',
          args: TransactionDialogRouteArgs(
            key: key,
            transaction: transaction,
            onClickDone: onClickDone,
          ),
        );

  static const String name = 'TransactionDialogRoute';
}

class TransactionDialogRouteArgs {
  const TransactionDialogRouteArgs({
    this.key,
    this.transaction,
    required this.onClickDone,
  });

  final Key? key;

  final Transaction? transaction;

  final dynamic Function(
    String,
    double,
    bool,
  ) onClickDone;

  @override
  String toString() {
    return 'TransactionDialogRouteArgs{key: $key, transaction: $transaction, onClickDone: $onClickDone}';
  }
}
